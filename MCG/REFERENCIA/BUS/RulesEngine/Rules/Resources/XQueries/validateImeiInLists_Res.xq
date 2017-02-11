(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_VALIDATEIMEIINLISTS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_VALIDATEIMEIINLISTS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/validateImeiInLists";
declare namespace ns1 = "http://xmlns.oracle.com/ValidateImeiInLists/DS_ValidateImeiInLists";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/ValidateImeiFact";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateImeiInLists_Res/";

declare function xf:validateImeiInLists_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <code>1</code>
            <message>
                <product>{ $callFunctionStatelessDecision1/ns1:resultList/ns4:ValidateImeiInListsFactResponse/product/@* , $callFunctionStatelessDecision1/ns1:resultList/ns4:ValidateImeiInListsFactResponse/product/node() }</product>
            </message>
            <description>Operacion Ejecutada</description>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:validateImeiInLists_Res($callFunctionStatelessDecision1)
