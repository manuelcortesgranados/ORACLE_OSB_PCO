(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_DOWNGRADEGENERALVALIDATION_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_DOWNGRADEGENERALVALIDATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/DowngradeGeneralValidationFact";
declare namespace ns1 = "http://xmlns.oracle.com/DowngradeGeneralValidation/DS_DowngradeGeneralValidation";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/downgradeGeneralValidation";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/downgradeGeneralValidation_Res/";

declare function xf:downgradeGeneralValidation_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns1:resultList/ns2:DowngradeGeneralValidationFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns1:resultList/ns2:DowngradeGeneralValidationFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:downgradeGeneralValidation_Res($callFunctionStatelessDecision1)
