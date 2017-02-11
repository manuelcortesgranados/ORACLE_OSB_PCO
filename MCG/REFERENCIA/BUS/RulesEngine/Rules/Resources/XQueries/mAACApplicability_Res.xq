(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_MAACAPPLICABILITY_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_MAACAPPLICABILITY.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/MAACApplicability/DS_MAACApplicability";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/MAACApplicabilityFact/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/mAACApplicability";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/mAACApplicability_Res/";

declare function xf:mAACApplicability_Res($callFunctionStatelessDecision as element(ns2:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
        	<code>1</code>
            <message>
                <plan>{ $callFunctionStatelessDecision/ns2:resultList/ns1:MAACApplicabilityFactResponse/Plan/@* , $callFunctionStatelessDecision/ns2:resultList/ns1:MAACApplicabilityFactResponse/Plan/node() }</plan>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns2:callFunctionStatelessDecision) external;

xf:mAACApplicability_Res($callFunctionStatelessDecision)