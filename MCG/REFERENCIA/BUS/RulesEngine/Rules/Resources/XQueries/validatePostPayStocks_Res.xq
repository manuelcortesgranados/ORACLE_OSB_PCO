(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_VALIDATEPOSTPAYSTOCKS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_VALIDATEPOSTPAYSTOCKS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/ValidatePostPayStocks/DS_ValidatePostPayStocks";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/validatePostPayStocks";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/ValidatePostPayStocksFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validatePostPayStocks_Res/";

declare function xf:validatePostPayStocks_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <product>{ $callFunctionStatelessDecision1/ns1:resultList/ns0:ValidatePostPayStocksFactResponse/Product/@* , $callFunctionStatelessDecision1/ns1:resultList/ns0:ValidatePostPayStocksFactResponse/Product/node() }</product>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:validatePostPayStocks_Res($callFunctionStatelessDecision1)
