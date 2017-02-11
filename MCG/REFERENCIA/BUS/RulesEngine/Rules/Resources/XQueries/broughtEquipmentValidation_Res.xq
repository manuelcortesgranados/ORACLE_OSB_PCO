(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns3:callFunctionStatelessDecision" location="../../../Rules/Resources/Schemas/BR_BROUGTHEQUIPMENTVALIDATION_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../../../Rules/Resources/Schemas/PS_BROUGTHEQUIPMENTVALIDATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/broughtEquipmentValidation";
declare namespace ns3 = "http://xmlns.oracle.com/BroughtEquipmentValidation/DS_BroughtEquipmentValidation";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/BroughtEquipmentValidationFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/broughtEquipmentValidation_Res/";

declare function xf:broughtEquipmentValidation_Res($callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision))
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
            <code>1</code>
            <message>
                <product>{ $callFunctionStatelessDecision1/ns3:resultList/ns5:BroughtEquipmentValidationFactResponse/Product/@* , $callFunctionStatelessDecision1/ns3:resultList/ns5:BroughtEquipmentValidationFactResponse/Product/node() }</product>
            </message>
            <description>Operacion ejecutada</description>
        </ns4:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision) external;

xf:broughtEquipmentValidation_Res($callFunctionStatelessDecision1)
