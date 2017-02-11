(:: pragma bea:schema-type-parameter parameter="$service" type="ns0:Service" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_DYNAMIC_ROUTER.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/dynamicRouter";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/stepExecuterToDynamicRouter/";

declare function xf:stepExecuterToDynamicRouter($service as element(),
	$entityCollection as element())
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <service>{ fn-bea:trim($service/endpoint) }</service>
            <parameters>
            {
	            element{expanded-QName(fn-bea:trim($service/namespace), 'Input_Parameters') }
	            {
	                for $parameter in $service/parameter
	                return
	                	let $entity := ($entityCollection//*[name = data($parameter/entity)])[1]
	                	return
	                    	xf:entityAssembler(data($parameter/name), $entity)
	            }
	        }
            </parameters>
        </ns1:Input_Parameters>
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
					if (data($innerEntity/value/*) or not(empty($innerEntity/value/*))) then
						xf:entityAssembler(data($innerEntity/mapping), $innerEntity)
					else ()
			}
};

declare variable $service as element() external;
declare variable $entityCollection as element() external;

xf:stepExecuterToDynamicRouter($service,
	$entityCollection)