xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../../../Framework/Resources/Schemas/PS_RULES_ENGINE_MANAGER.xsd" ::)
(:: pragma bea:global-element-return element="ns1:PerformFullCreditEvaluationResponse" location="../Schemas/PS_PERFORMFULLCREDITEVALUATION.xsd" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/rulesManager_Res_performFullCreditEvaluation/";
declare namespace ns1 = "http://performfullcreditevaluation.creditcalculation.schema.amx.com";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/manager";

declare function xf:rulesManager_Res_performFullCreditEvaluation($wS_Result1 as element(ns0:WS_Result))
    as element(ns1:PerformFullCreditEvaluationResponse) {
        <ns1:PerformFullCreditEvaluationResponse>
        
         <status>{ data($wS_Result1/message/entities/customerOrder/status/description) }</status>
         <descriptions>{ data($wS_Result1/message/entities/customerOrder/exceptionBusiness/description) }</descriptions>
         {
         for $exceptions in $wS_Result1/message/entities/customerOrder/exceptions
            return
           
            <exceptions>
              {$exceptions/node()}
            </exceptions>
         }  
         <creditRefNumber>{ data($wS_Result1/message/entities/customerOrder/creditReference/creditRefNumber) }</creditRefNumber>
         <homeVisitRequired>{ data($wS_Result1/message/entities/customerOrder/homeVisitRequired) }</homeVisitRequired>
         <isOverrideImmediatePayment>{ data($wS_Result1/message/entities/customerOrder/isOverrideImmediatePayment) }</isOverrideImmediatePayment>
         
         {
         for $conditions in $wS_Result1/message/entities/customerOrder/conditions
            return
           
            <conditions>
              <orderActionID>{$conditions/orderActionID}</orderActionID>
              <numRCInAdvanced>{$conditions/numRCInAdvanced}</numRCInAdvanced>
              <installmentZero>{$conditions/installmentZero}</installmentZero>
              <numOfInstallments>{$conditions/numOfInstallments}</numOfInstallments>
              <installmentAmount>{$conditions/installmentAmount}</installmentAmount>
              <deposit>{$conditions/deposit}</deposit>
            </conditions>
         } 
         {
         for $documents in $wS_Result1/message/entities/customerOrder/documents
            return
           
            <documents>
              {$documents/node()}
            </documents>
         }
         { 
         for $extraDocuments in $wS_Result1/message/entities/customerOrder/extraDocuments
            return
           
            <extraDocuments>
              {$extraDocuments/node()}
            </extraDocuments>
         } 
         { 
         for $creditApprovalIDOutput in $wS_Result1/message/entities/customerOrder/creditApprovalIDOutput
            return
           
            <creditApprovalIDOutput>
              {$creditApprovalIDOutput/node()}
            </creditApprovalIDOutput>
         } 
         
        </ns1:PerformFullCreditEvaluationResponse>
};

declare variable $wS_Result1 as element(ns0:WS_Result) external;

xf:rulesManager_Res_performFullCreditEvaluation($wS_Result1)
