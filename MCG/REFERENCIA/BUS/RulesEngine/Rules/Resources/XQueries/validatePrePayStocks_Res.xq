(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_VALIDATEPREPAYSTOCKS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_VALIDATEPREPAYSTOCKS.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/ValidatePrePayStocks/DS_ValidatePrePayStocks";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/ValidatePrePayStocksFact";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/validatePrePayStocks";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validatePrePayStocks_Res/";

declare function xf:validatePrePayStocks_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <product>{ $callFunctionStatelessDecision1/ns2:resultList/ns3:ValidatePrePayStocksFactResponse/Product/@* , $callFunctionStatelessDecision1/ns2:resultList/ns3:ValidatePrePayStocksFactResponse/Product/node() }</product>
            </message>
            <description>Operacion ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:validatePrePayStocks_Res($callFunctionStatelessDecision1)
