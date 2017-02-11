(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_NUNCACLIENTEXCLUSIONSCHANGEPLAN_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_NUNCACLIENTEXCLUSIONSCHANGEPLAN.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/NuncaClientExclusionChangePlan/DS_NuncaClientExclusionChangePlan";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/NuncaClientExclusionChangePlanFact/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/nuncaClientExclusionsChangePlan";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Proxies/nuncaClientExclusionsChangePlan_Res/";

declare function xf:nuncaClientExclusionsChangePlan_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns1:resultList/ns3:NuncaClientExclusionChangePlanResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns1:resultList/ns3:NuncaClientExclusionChangePlanResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Success</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:nuncaClientExclusionsChangePlan_Res($callFunctionStatelessDecision1)
