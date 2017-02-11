(:: pragma bea:global-element-parameter parameter="$validateEquipmentRequest" element="ns0:ValidateEquipmentRequest" location="../../../../../RulesEngine/Core/Resources/Schemas/PS_VALIDATE_EQUIPMENT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ValidateEquipmentResponse" location="../../../../../RulesEngine/Core/Resources/Schemas/PS_VALIDATE_EQUIPMENT.xsd" ::)

declare namespace ns0 = "http://validateequipment.equipmentmanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Dummies/Resources/XQueries/validateEquipmentDummy_Res/";

declare function xf:validateEquipmentDummy_Res($validateEquipmentRequest as element(ns0:ValidateEquipmentRequest))
    as element(ns0:ValidateEquipmentResponse) {
        <ns0:ValidateEquipmentResponse>
            {
                for $equipment in $validateEquipmentRequest/ns0:Equipment
                return
                    <ns0:Equipment>
                        <ns0:equipmentType>{ data($equipment/ns0:equipmentType) }</ns0:equipmentType>
                        <ns0:materialCode>{ data($equipment/ns0:materialCode) }</ns0:materialCode>
                        <ns0:equipmentIdentifier>{ data($equipment/ns0:equipmentIdentifier) }</ns0:equipmentIdentifier>
                        <ns0:status>true</ns0:status>
                		<ns0:isComcel>true</ns0:isComcel>
                		<ns0:make>Avasg</ns0:make>
                		<ns0:model>I9300</ns0:model>
                		<ns0:validationMessage></ns0:validationMessage>
                    </ns0:Equipment>
            }
        </ns0:ValidateEquipmentResponse>
};

declare variable $validateEquipmentRequest as element(ns0:ValidateEquipmentRequest) external;

xf:validateEquipmentDummy_Res($validateEquipmentRequest)
