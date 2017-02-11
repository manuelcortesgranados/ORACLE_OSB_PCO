(:: pragma bea:schema-type-parameter parameter="$entities" type="ns0:EntityCollection" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma  parameter="$payload" type="anyType" ::)
(:: pragma bea:schema-type-return type="ns0:EntityCollection" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)

declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/entityPopulator/";

declare function xf:entityPopulator($entities as element(),
    $payload as element())
    as element() {
        <entities>
            {
                for $entity in $entities/entity
                return
                    xf:entityDisassembler($entity, $payload/*[local-name() = data($entity/mapping)])
            }
        </entities>
};

declare function xf:entityDisassembler($entity as element(),
    $instance as element()*)
    as element() {
    	let $complexFields := $instance/*[not(empty(index-of(data($entity/entities/entity/mapping), local-name())))]
    	return
        	<entity>
				<id>{data($entity/id)}</id>
				<name>{data($entity/name)}</name>
				<mapping>{data($entity/mapping)}</mapping>
				<list>{data($entity/list)}</list>
				<value>
				{
					for $subinstance in $instance
					return
						element{local-name($subinstance)}
						{
							$subinstance/*[empty(index-of(data($entity/entities/entity/mapping), local-name()))]
						}
				}
				</value>
				{
					if (count($entity/entities/entity) > 0) then
						<entities>
							{
								for $innerEntity in $entity/entities/entity
								return
									let $complexField := $complexFields[local-name() = data($innerEntity/mapping)]
									return
										if (data($complexField)) then
											xf:entityDisassembler($innerEntity, $complexField)
										else
											$innerEntity
							}
						</entities>
					else ()
				}
			</entity>
};

declare variable $entities as element() external;
declare variable $payload as element() external;

xf:entityPopulator($entities,
    $payload)