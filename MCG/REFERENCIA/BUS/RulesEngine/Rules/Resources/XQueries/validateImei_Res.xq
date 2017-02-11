(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_VALIDATEIMEI_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_VALIDATEIMEI.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/ValidateImei/DS_ValidateImei";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/ValidateImeiFact";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/validateImei";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateImei_Res/";

declare function xf:validateImei_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <product>{ $callFunctionStatelessDecision1/ns2:resultList/ns1:ValidateImeiFactResponse/Product/@* , $callFunctionStatelessDecision1/ns2:resultList/ns1:ValidateImeiFactResponse/Product/node() }</product>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:validateImei_Res($callFunctionStatelessDecision1)
