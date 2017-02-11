(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns0:callFunctionStatelessDecision" location="../Schemas/BR_CREDITRECLASSIFICATION_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_CREDITRECLASSIFICATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/CreditReclassifcationFact/";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/creditReclassification";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://xmlns.oracle.com/CreditReclassification/DS_CreditReclassification";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditReclassification_Res/";

declare function xf:creditReclassification_Res($callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision))
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
        	<code>1</code>
            <message>
                <customerBillingBehavior>{ $callFunctionStatelessDecision1/ns0:resultList/ns2:CreditReclassifcationFactResponse/CustomerBillingBehavior/@* , $callFunctionStatelessDecision1/ns0:resultList/ns2:CreditReclassifcationFactResponse/CustomerBillingBehavior/node() }</customerBillingBehavior>
            </message>
        </ns4:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision) external;

xf:creditReclassification_Res($callFunctionStatelessDecision1)
