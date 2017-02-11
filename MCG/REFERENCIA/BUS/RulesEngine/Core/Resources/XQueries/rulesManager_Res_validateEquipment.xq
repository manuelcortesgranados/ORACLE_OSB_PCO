(:: pragma  parameter="$entities" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:ValidateEquipmentResponse" location="../Schemas/PS_VALIDATE_EQUIPMENT.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/manager";
declare namespace ns0 = "http://validateequipment.equipmentmanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/rulesManager_Res_validateEquipment/";

declare function xf:rulesManager_Res_validateEquipment($entities as element(*))
    as element(ns0:ValidateEquipmentResponse) {
        <ns0:ValidateEquipmentResponse>
        {
        	for $product in $entities/product
        	return
            <ns0:Equipment>
                <ns0:equipmentType>{ data($product/type/description) }</ns0:equipmentType>
                <ns0:materialCode>{ data($product/stockInventory/material) }</ns0:materialCode>
                <ns0:equipmentIdentifier>{ data($product/id) }</ns0:equipmentIdentifier>
                <ns0:status>{ data($product/status/description) }</ns0:status>
                <ns0:isComcel></ns0:isComcel>
                <ns0:make></ns0:make>
                <ns0:model></ns0:model>
                <ns0:validationMessage>{ data($product/validationMessage) }</ns0:validationMessage>
            </ns0:Equipment>
        }   
        </ns0:ValidateEquipmentResponse>
};

declare variable $entities as element(*) external;

xf:rulesManager_Res_validateEquipment($entities)
