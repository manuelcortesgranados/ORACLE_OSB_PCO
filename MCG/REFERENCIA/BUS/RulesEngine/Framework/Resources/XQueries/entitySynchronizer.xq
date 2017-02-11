xquery version "1.0" encoding "Cp1252";
(:: pragma bea:schema-type-parameter parameter="$entityCollection" type="ns0:EntityCollection" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma  parameter="$payload" type="xs:anyType" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/entitySynchronizer/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";

declare function xf:entitySynchronizer($entityCollection as element(),
    $payload as element(*))
    as element(*) {
       <entities>
            {
                for $entity in $entityCollection/entity
                return
                	if (data($payload/*[local-name() = data($entity/name)])) then
                    	xf:entityDisassembler($entity, $payload/*[local-name() = data($entity/name)])
                    else
                    	if (xf:payloadHasDescendants($entity, $payload)) then
	                    	for $instanceName in distinct-values(for $instance in $payload/* return local-name($instance))
		                	return
		                    	if (xf:instanceContained($instanceName, $entity)) then
	                    			xf:entityDisassembler($entity, $payload/*[local-name() = $instanceName])
	                    		else ()
		                else
		                	$entity
            }
        </entities>
};

declare function xf:entityDisassembler($entity as element(),
    $instance as element()*)
    as element() {
    	let $rootMatch := local-name($instance[1]) = $entity/mapping or local-name($instance[1]) = $entity/name
	    return
	    	element{'entity'}
			{
				$entity/id,
				$entity/name,
				$entity/mapping,
				$entity/list,
				<value>
				{
					if ($rootMatch) then
						for $subinstance in $instance
						return
							let $simpleFields := $subinstance/*[empty(index-of(data($entity/entities/entity/mapping), local-name()))]
							return
								element{local-name($subinstance)}
								{
									$simpleFields
								}
					else
						$entity/value/node()
				}
				</value>,
				if (count($entity/entities/entity) > 0) then
					element{'entities'}
					{
						for $innerEntity in $entity/entities/entity
						return
							if ($rootMatch) then
								let $complexFields := $instance/*[not(empty(index-of(data($entity/entities/entity/mapping), local-name())))]
								let $complexField := $complexFields[local-name() = data($innerEntity/mapping)]
								return
									if (data($complexField)) then
										xf:entityDisassembler($innerEntity, $complexField)
									else
										$innerEntity
							else
								xf:entityDisassembler($innerEntity, $instance)
					}
				else ()
			}
};

declare function xf:payloadHasDescendants($entity as element(),
	$payload as element())
	as xs:boolean {
		let $instancesNames := distinct-values(for $instance in $payload/* return local-name($instance))
		let $descendants := for $instanceName in $instancesNames return if (xf:instanceContained($instanceName, $entity)) then 1 else 0
		return
	    	if (sum($descendants) = 0) then false() else true()
};

declare function xf:instanceContained($instanceName as xs:string,
	$entity as element())
	as xs:boolean {
		count($entity[$instanceName = data($entity/*//mapping) or $instanceName = data($entity/*//name)]) != 0
};

declare variable $entityCollection as element() external;
declare variable $payload as element(*) external;

xf:entitySynchronizer($entityCollection,
    $payload)
