(:: pragma bea:schema-type-parameter parameter="$entityCollection" type="ns0:EntityCollection" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma  type="anyType" ::)

declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/entityExtractor/";

declare function xf:entityExtractor($entityCollection as element())
	as element(*) {
		<entities>
			{
				for $entity in $entityCollection/entity
				return
					xf:entityAssembler(data($entity/name), $entity)
			}
		</entities>
};

declare function xf:entityAssembler($entityName as xs:string,
	$entity as element())
	as element()* {
		if (data($entity/list) = true()) then
			for $value in $entity/value/*
			return
				element{$entityName}
				{
					$value/*
				}
		else
			element{$entityName}
			{
				$entity/value/*/*,
				for $innerEntity in $entity/entities/entity
				return
					if (data($innerEntity/value/*)) then
						xf:entityAssembler(data($innerEntity/mapping), $innerEntity)
					else ()
			}
};

declare variable $entityCollection as element() external;

xf:entityExtractor($entityCollection)
