(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_SUPERUSEREXCLUSIONSCHANGEPLAN_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_SUPERUSEREXCLUSIONSCHANGEPLAN.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/SuperUserExclusionsChangePlan/DS_SuperUserExclusionsChangePlan";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/superUserExclusionsChangePlan";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/SuperUserExclusionChangePlanFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/superUserExclusionsChangePlan_Res/";

declare function xf:superUserExclusionsChangePlan_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns2:resultList/ns0:SuperUserExclusionChangePlanResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns2:resultList/ns0:SuperUserExclusionChangePlanResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:superUserExclusionsChangePlan_Res($callFunctionStatelessDecision1)
