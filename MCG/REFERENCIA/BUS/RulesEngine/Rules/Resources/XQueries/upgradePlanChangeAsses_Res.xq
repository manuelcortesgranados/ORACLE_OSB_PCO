(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_UPGRADEPLANCHANGEASSES_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_UPGRADEPLANCHANGEASSES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/UpgradePlanChangeAssess/DS_UpgradePlanChangeAssess";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/UpgradePlanChangeAssessFact/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/upgradePlanChangeAsses";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/upgradePlanChangeAsses_Res/";

declare function xf:upgradePlanChangeAsses_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns2:resultList/ns1:UpgradePlanChangeAssessFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns2:resultList/ns1:UpgradePlanChangeAssessFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:upgradePlanChangeAsses_Res($callFunctionStatelessDecision1)
