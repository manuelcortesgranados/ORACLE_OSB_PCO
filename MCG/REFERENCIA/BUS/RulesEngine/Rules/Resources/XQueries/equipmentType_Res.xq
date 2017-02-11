(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns3:callFunctionStatelessDecision" location="../Schemas/BR_EQUIPMENTTYPE_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_EQUIPMENTTYPE.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/EquipmentTypeFact";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/equipmentType";
declare namespace ns3 = "http://xmlns.oracle.com/EquipmentType/DS_EquipmentType";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/equipmentType_Res/";

declare function xf:equipmentType_Res($callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <code>1</code>
            <message>
                <plan>{ $callFunctionStatelessDecision1/ns3:resultList/ns2:EquipmentTypeFactResponse/Plan/@* , $callFunctionStatelessDecision1/ns3:resultList/ns2:EquipmentTypeFactResponse/Plan/node() }</plan>
            </message>
            <description>Operacion ejecutada</description>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision) external;

xf:equipmentType_Res($callFunctionStatelessDecision1)
