(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_CREDITEXCEPTIONSAPPLICABILITY_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_CREDITEXCEPTIONSAPPLICABILITY.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/CreditExceptionsApplicability/DS_CreditExceptionsApplicability";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/creditExceptionsApplicability";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/CreditExceptionsApplicabilityFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditExceptionsApplicability_Res/";

declare function xf:creditExceptionsApplicability_Res($callFunctionStatelessDecision as element(ns2:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
        	<code>1</code>
            <message>
                <plan>{ $callFunctionStatelessDecision/ns2:resultList/ns0:CreditExceptionsApplicabilityFactResponse/Plan/@* , $callFunctionStatelessDecision/ns2:resultList/ns0:CreditExceptionsApplicabilityFactResponse/Plan/node() }</plan>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns2:callFunctionStatelessDecision) external;

xf:creditExceptionsApplicability_Res($callFunctionStatelessDecision)
