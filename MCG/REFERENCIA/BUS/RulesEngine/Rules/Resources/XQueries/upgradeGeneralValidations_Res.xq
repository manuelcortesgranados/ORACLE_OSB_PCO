(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_UPGRADEGENERALVALIDATIONS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_UPGRADEGENERALVALIDATIONS.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/UpgradeGeneralValidations/DS_UpgradeGeneralValidations";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/upgradeGeneralValidations";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/UpgradeGeneralValidationsFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/upgradeGeneralValidations_Res/";

declare function xf:upgradeGeneralValidations_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns2:resultList/ns0:UpgradeGeneralValidationsFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns2:resultList/ns0:UpgradeGeneralValidationsFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:upgradeGeneralValidations_Res($callFunctionStatelessDecision1)
