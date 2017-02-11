(:: pragma bea:global-element-parameter parameter="$performFullCreditEvaluationRequest" element="ns0:PerformFullCreditEvaluationRequest" location="../../../../../RulesEngine/Core/Resources/Schemas/PS_PERFORMFULLCREDITEVALUATION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:PerformFullCreditEvaluationResponse" location="../../../../../RulesEngine/Core/Resources/Schemas/PS_PERFORMFULLCREDITEVALUATION.xsd" ::)

declare namespace ns0 = "http://performfullcreditevaluation.creditcalculation.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Dummies/Resources/XQueries/performFullCreditEvaluationDummy_Res/";

declare function xf:performFullCreditEvaluationDummy_Res($performFullCreditEvaluationRequest as element(ns0:PerformFullCreditEvaluationRequest))
    as element(ns0:PerformFullCreditEvaluationResponse) {
        <ns0:PerformFullCreditEvaluationResponse>
            <status>Valid</status>
            <descriptions>No descriptions</descriptions>
            <exceptions>No exceptions</exceptions>
            <creditRefNumber>1234567800-9</creditRefNumber>
            <homeVisitRequired>true</homeVisitRequired>
            <isOverrideImmediatePayment>false</isOverrideImmediatePayment>
            <Conditions>
                <orderActionId>200</orderActionId>
                <numRCInAdvanced>8000987</numRCInAdvanced>
                <installmentZero>None</installmentZero>
                <numOfInstallments>0</numOfInstallments>
                <installmentAmount>1500000</installmentAmount>
                <deposit>0</deposit>
            </Conditions>
            <documents>Client documents</documents>
            <extraDocuments>Optional documents</extraDocuments>
            <creditApprovalIDOutput>Approved</creditApprovalIDOutput>
        </ns0:PerformFullCreditEvaluationResponse>
};

declare variable $performFullCreditEvaluationRequest as element(ns0:PerformFullCreditEvaluationRequest) external;

xf:performFullCreditEvaluationDummy_Res($performFullCreditEvaluationRequest)
