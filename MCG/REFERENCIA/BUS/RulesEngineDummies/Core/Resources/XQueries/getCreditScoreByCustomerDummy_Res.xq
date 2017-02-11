(:: pragma bea:global-element-parameter parameter="$getCreditScoreByCustomerRequest" element="ns0:GetCreditScoreByCustomerRequest" location="../../../../../RulesEngine/Core/Resources/Schemas/PS_GET_CREDITSCOREBYCUSTOMER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetCreditScoreByCustomerResponse" location="../../../../../RulesEngine/Core/Resources/Schemas/PS_GET_CREDITSCOREBYCUSTOMER.xsd" ::)

declare namespace ns0 = "http://getcreditscorebycustomer.performancemanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Dummies/Resources/XQueries/getCreditScoreByCustomerDummy_Res/";

declare function xf:getCreditScoreByCustomerDummy_Res($getCreditScoreByCustomerRequest as element(ns0:GetCreditScoreByCustomerRequest))
    as element(ns0:GetCreditScoreByCustomerResponse) {
        <ns0:GetCreditScoreByCustomerResponse>
            <ns0:GetCreditScoreResponseInfo>
                <ns0:firstName>{ data($getCreditScoreByCustomerRequest/ns0:CreditScoreInformation/ns0:firstName) }</ns0:firstName>
                <ns0:secondName>isabel</ns0:secondName>
                <ns0:lastName>{ data($getCreditScoreByCustomerRequest/ns0:CreditScoreInformation/ns0:lastName) }</ns0:lastName>
                <ns0:secondLastName>mendez</ns0:secondLastName>
                <ns0:issueDateOfId>2013-05-08</ns0:issueDateOfId>
                <ns0:scoreExpiryDate>2013-05-09</ns0:scoreExpiryDate>
                <ns0:dateCreditBureauConsulted>2013-05-10</ns0:dateCreditBureauConsulted>
                <ns0:evidentaAlreadyValid>true</ns0:evidentaAlreadyValid>
                <ns0:creditScoreCode>102386311</ns0:creditScoreCode>
                <ns0:creditScoreDescription>10238632</ns0:creditScoreDescription>
                <ns0:gama>baja</ns0:gama>
                <ns0:exceptions>error</ns0:exceptions>
                <ns0:ageRange>12</ns0:ageRange>
                <ns0:idPlaceOfIssue>bogota</ns0:idPlaceOfIssue>
                <ns0:idExpirationDate>2013-05-31</ns0:idExpirationDate>
                <ns0:listOfRequiredDocuments>22</ns0:listOfRequiredDocuments>
                <ns0:paymentBehavior>bueno</ns0:paymentBehavior>
                <ns0:pastDueAmount>20000</ns0:pastDueAmount>
                <ns0:planType>abierto</ns0:planType>
                <ns0:purchaseLimit>30000</ns0:purchaseLimit>
                <ns0:totalNumberOfLines>3</ns0:totalNumberOfLines>
                <ns0:rcPaymentInAdvancedRequired>3</ns0:rcPaymentInAdvancedRequired>
                <ns0:equipmentImmediatePaymentRequired>si</ns0:equipmentImmediatePaymentRequired>
                <ns0:payMeansRequired>targeta</ns0:payMeansRequired>
                <ns0:acquisitionType>no se</ns0:acquisitionType>
                <ns0:url>http://claro.com.co</ns0:url>
            </ns0:GetCreditScoreResponseInfo>
            <ns0:NumberOfLinesAllowedPerGAMAandProductType>
                <ns0:totalNumberOfLinesAllowed>10</ns0:totalNumberOfLinesAllowed>
                <ns0:gama>alta</ns0:gama>
            </ns0:NumberOfLinesAllowedPerGAMAandProductType>
            <ns0:NumberOfLinesAllowedPerGAMAandProductType>
                <ns0:totalNumberOfLinesAllowed>2</ns0:totalNumberOfLinesAllowed>
                <ns0:gama>media</ns0:gama>
            </ns0:NumberOfLinesAllowedPerGAMAandProductType>
        </ns0:GetCreditScoreByCustomerResponse>
};

declare variable $getCreditScoreByCustomerRequest as element(ns0:GetCreditScoreByCustomerRequest) external;

xf:getCreditScoreByCustomerDummy_Res($getCreditScoreByCustomerRequest)
