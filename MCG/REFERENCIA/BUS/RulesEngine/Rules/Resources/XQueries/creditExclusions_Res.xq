(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns4:callFunctionStatelessDecision" location="../Schemas/BR_CREDITEXCLUSIONS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_CREDITEXCLUSIONS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://xmlns.oracle.com/CreditExclusions/DS_CreditExclusions";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/creditExclusions";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditExclusions_Res/";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/CreditExclusionsFact/";
declare namespace ns7 = "http://xmlns.oracle.com/bpel";
declare namespace ns8 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";

declare function xf:creditExclusions_Res($callFunctionStatelessDecision as element(ns4:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision/ns4:resultList/ns6:CreditExclusionsFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision/ns4:resultList/ns6:CreditExclusionsFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Ejecucion exitosa</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns4:callFunctionStatelessDecision) external;

xf:creditExclusions_Res($callFunctionStatelessDecision)
