(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_HASCREDITREFERENCENUMBREMAAC_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_HASCREDITREFERENCENUMBREMAAC.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/hasCreditReferenceNumberMAAC";
declare namespace ns1 = "http://xmlns.oracle.com/HasCreditReferenceNumberMAAC/DS_HasCreditReferenceNumberMAAC";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/HasCreditReferenceNumberMAACFact/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/hasCreditReferenceNumberMAAC_Res/";

declare function xf:hasCreditReferenceNumberMAAC_Res($callFunctionStatelessDecision as element(ns1:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        	<code>1</code>
            <message>
            {
            	for $plan in $callFunctionStatelessDecision/ns1:resultList/ns3:HasCreditReferenceNumberMAACFactResponse/Plan
            	return
                <plan>{ $plan/@* , $plan/node() }</plan>
            }
            </message>
            <description>Operacion Ejecutada</description>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns1:callFunctionStatelessDecision) external;

xf:hasCreditReferenceNumberMAAC_Res($callFunctionStatelessDecision)