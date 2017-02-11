(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_VALIDATESTOCKS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_VALIDATESTOCKS.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/ValidateStocks/DS_ValidateStocks";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/ValidateStocksFact";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/validateStocks";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateStocks_Res/";

declare function xf:validateStocks_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                {
                    for $Plan in $callFunctionStatelessDecision1/ns2:resultList/ns3:ValidateStocksFactResponse/Plan
                    return
                           $Plan
                      
                }
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:validateStocks_Res($callFunctionStatelessDecision1)
