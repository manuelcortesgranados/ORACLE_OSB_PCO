(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns0:callFunctionStatelessDecision" location="../Schemas/BR_GENERALVALIDATIONS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_GENERALVALIDATIONS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/generalValidations";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/GeneralValidationsFact/";
declare namespace ns0 = "http://xmlns.oracle.com/GeneralValidations/DS_GeneralValidations";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/generalValidations_Res/";

declare function xf:generalValidations_Res($callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns0:resultList/ns3:GeneralValidationsFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns0:resultList/ns3:GeneralValidationsFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision) external;

xf:generalValidations_Res($callFunctionStatelessDecision1)
