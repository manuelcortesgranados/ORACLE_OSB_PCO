(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../../../Framework/Resources/Schemas/PS_RULES_ENGINE_MANAGER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetCreditScoreByCustomerResponse" location="../Schemas/PS_GET_CREDITSCOREBYCUSTOMER.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/manager";
declare namespace ns0 = "http://getcreditscorebycustomer.performancemanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/rulesManager_Res_getCreditScoreByCustomer/";

declare function xf:rulesManager_Res_getCreditScoreByCustomer($wS_Result as element(ns1:WS_Result))
    as element(ns0:GetCreditScoreByCustomerResponse) {
        <ns0:GetCreditScoreByCustomerResponse>
            <ns0:GetCreditScoreResponseInfo>
                <ns0:firstName>{ data($wS_Result/message/entities/customer/firstName) }</ns0:firstName>
                <ns0:secondName>{  data($wS_Result/message/entities/customer/secondName) }</ns0:secondName>
                <ns0:lastName>{ data($wS_Result/message/entities/customer/lastName) }</ns0:lastName>
                <ns0:secondLastName>{ data($wS_Result/message/entities/customer/secondLastName) }</ns0:secondLastName>
                <ns0:issueDateOfId>{ data($wS_Result/message/entities/customer/issueDateOfID) }</ns0:issueDateOfId>
                <ns0:scoreExpiryDate>{ data($wS_Result/message/entities/customer/billingBehavior/scoreExpiryDate) }</ns0:scoreExpiryDate>
                <ns0:dateCreditBureauConsulted>{ data($wS_Result/message/entities/customer/billingBehavior/dateCreditBureauConsulted) }</ns0:dateCreditBureauConsulted>
                <ns0:creditRefNumber>{ data($wS_Result/message/entities/customer/billingBehavior/creditRefNumber) }</ns0:creditRefNumber>
                <ns0:evidentaAlreadyValid>{ data($wS_Result/message/entities/customer/billingBehavior/evidentaAlreadyValid) }</ns0:evidentaAlreadyValid>
                <ns0:creditScoreCode>{ data($wS_Result/message/entities/customer/billingBehavior/creditScoreCode) }</ns0:creditScoreCode>
                <ns0:creditScoreDescription>{ data($wS_Result/message/entities/customer/billingBehavior/creditScoreDescription) }</ns0:creditScoreDescription>
                <ns0:gama>{ data($wS_Result/message/entities/customer/product/type/description) }</ns0:gama>
                <ns0:exceptions>{ data($wS_Result/message/entities/exceptionBusinessCollection/businessException/exceptionBusinessType/description) }</ns0:exceptions>
                <ns0:evaluationStatus></ns0:evaluationStatus>   (: solo Chile :)
                <ns0:ceRejectMessage></ns0:ceRejectMessage>   (: solo Chile :)
                <ns0:ageRange>{ data($wS_Result/message/entities/customer/ageRange) }</ns0:ageRange>
                <ns0:idPlaceOfIssue>{ data($wS_Result/message/entities/customer/location/city/description) }</ns0:idPlaceOfIssue>
                <ns0:idExpirationDate>{ data($wS_Result/message/entities/customer/issueDateOfID) }</ns0:idExpirationDate>
                <ns0:listOfRequiredDocuments></ns0:listOfRequiredDocuments> (: solo Chile :)
                <ns0:paymentBehavior>{ data($wS_Result/message/entities/customer/billingBehavior/description) }</ns0:paymentBehavior>
                <ns0:pastDueAmount>{ data($wS_Result/message/entities/customer/billingBehavior/delayValue) }</ns0:pastDueAmount>
                <ns0:planType>{ data($wS_Result/message/entities/customer/product/type/description) }</ns0:planType>
                <ns0:purchaseLimit></ns0:purchaseLimit> (: solo Chile :)
                <ns0:totalNumberOfLines>{ data($wS_Result/message/entities/salesMatrixResult/linesNumberTotal) }</ns0:totalNumberOfLines>
                <ns0:rcPaymentInAdvancedRequired></ns0:rcPaymentInAdvancedRequired> (: solo Chile :)
                <ns0:equipmentImmediatePaymentRequired></ns0:equipmentImmediatePaymentRequired> (: solo Chile :)
                <ns0:payMeansRequired></ns0:payMeansRequired> (: solo Chile :)
                <ns0:acquisitionType>AcquisitionType</ns0:acquisitionType>
                <ns0:url></ns0:url>  (: solo Chile :)
            </ns0:GetCreditScoreResponseInfo>
            <ns0:NumberOfLinesAllowedPerGAMAandProductType>
                <ns0:totalNumberOfLinesAllowed>{ data($wS_Result/message/entities/salesMatrixResult/linesNumberTotal) }</ns0:totalNumberOfLinesAllowed>
                <ns0:gama>{ data($wS_Result/message/entities/salesMatrixResult/gama) }</ns0:gama>
                <ns0:productType>{ data($wS_Result/message/entities/customer/product/type) }</ns0:productType>
            </ns0:NumberOfLinesAllowedPerGAMAandProductType>
            <ns0:numberOfFinancedActiveLines>{ data($wS_Result/message/entities/salesMatrixResult/linesNumberTotal) }</ns0:numberOfFinancedActiveLines>
        </ns0:GetCreditScoreByCustomerResponse>
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:rulesManager_Res_getCreditScoreByCustomer($wS_Result)
