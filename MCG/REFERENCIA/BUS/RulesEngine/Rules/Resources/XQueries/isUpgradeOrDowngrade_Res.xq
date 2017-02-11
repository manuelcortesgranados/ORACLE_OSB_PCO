(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_ISUPGRADEORDOWNGRADE_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_ISUPGRADEORDOWNGRADE.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace ns1 = "http://xmlns.oracle.com/IsUpgradeOrDowngrade/DS_IsUpgradeOrDowngrade";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/isUpgradeOrDowngrade";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/IsUpgradeOrDowngradeFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/isUpgradeOrDowngrade_Res/";

declare function xf:isUpgradeOrDowngrade_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                {
                    for $Plan in $callFunctionStatelessDecision1/ns1:resultList/ns0:IsUpgradeOrDowngradeFactResponse/Plan
                    return
                        <plan>{ $Plan/@* , $Plan/node() }</plan>
                }
            </message>
            <description>Operacion ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:isUpgradeOrDowngrade_Res($callFunctionStatelessDecision1)
