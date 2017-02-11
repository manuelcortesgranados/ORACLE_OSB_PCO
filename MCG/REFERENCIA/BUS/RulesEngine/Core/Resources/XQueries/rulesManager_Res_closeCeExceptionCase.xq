xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../../../Framework/Resources/Schemas/PS_RULES_ENGINE_MANAGER.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CloseCEExceptionCaseResponse" location="../Schemas/PS_CLOSECEEXCEPTIONCASE.xsd" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/rulesManager_Res_closeCeExceptionCase/";
declare namespace ns1 = "http://closeceexceptioncase.performancemanagement.schema.amx.com";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/manager";

declare function xf:rulesManager_Res_closeCeExceptionCase($wS_Result1 as element(ns0:WS_Result))
    as element(ns1:CloseCEExceptionCaseResponse) {
        <ns1:CloseCEExceptionCaseResponse>
		      {$wS_Result1/CloseCEExceptionCaseResponse/node()}
          </ns1:CloseCEExceptionCaseResponse>
};

declare variable $wS_Result1 as element(ns0:WS_Result) external;

xf:rulesManager_Res_closeCeExceptionCase($wS_Result1)
