(:: pragma bea:global-element-parameter parameter="$retrieveLineStatisticsResponse1" element="ns5:RetrieveLineStatisticsResponse" location="../../../../../RulesEngine/Amdocs/Resources/Schemas/BS_GET_CLIENTSTATISTICSLINES.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$customer" type="ns4:Input_Parameters/customer" location="../../../../../RulesEngine/Amdocs/Resources/Schemas/PS_GET_CLIENTSTATISTICSLINES.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../../../../../RulesEngine/Amdocs/Resources/Schemas/PS_GET_CLIENTSTATISTICSLINES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getClientStatisticsLines";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://retrievelinestatistics.performancemanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getClientStatisticsLinesTemp_Res/";

declare function xf:getClientStatisticsLinesTemp_Res($retrieveLineStatisticsResponse1 as element(ns5:RetrieveLineStatisticsResponse),
    $customer as element())
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
            <code>1</code>
            <message>
                <customer>
                    <id>{ data($customer/id) }</id>
                    <code>{ data($customer/code) }</code>
                    <description>{ data($customer/description) }</description>
                    <firstName>{ data($customer/firstName) }</firstName>
                    <secondName>{ data($customer/secondName) }</secondName>
                    <lastName>{ data($customer/lastName) }</lastName>
                    <secondLastName>{ data($customer/secondLastName) }</secondLastName>
                    <ageRange>{ data($customer/ageRange) }</ageRange>
                    {
                        for $document in $customer/document
                        return
                            <document>{ $document/@* , $document/node() }</document>
                    }
                    {
                        for $type in $customer/type
                        return
                            <type>{ $type/@* , $type/node() }</type>
                    }
                    <issueDateOfID>{ data($customer/issueDateOfID) }</issueDateOfID>
                    {
                        for $location in $customer/location
                        return
                            <location>{ $location/@* , $location/node() }</location>
                    }
                    <phoneNumber>{ data($customer/phoneNumber) }</phoneNumber>
                    <dateOfBirth>{ data($customer/dateOfBirth) }</dateOfBirth>
                    <nuncaIndicator>{ data($customer/nuncaIndicator) }</nuncaIndicator>
                    <vipIndicator>{ data($customer/vipIndicator) }</vipIndicator>
                    {
                        for $order in $customer/order
                        return
                            <order>
                                {
                                    for $id in $order/id
                                    return
                                        <id>{ data($id) }</id>
                                }
                                {
                                    for $code in $order/code
                                    return
                                        <code>{ data($code) }</code>
                                }
                                {
                                    for $description in $order/description
                                    return
                                        <description>{ concat($description) }</description>
                                }
                                {
                                    for $orderType in $order/orderType
                                    return
                                        <orderType>{ $orderType/@* , $orderType/node() }</orderType>
                                }
                                {
                                    for $causal in $order/causal
                                    return
                                        <causal>{ data($causal) }</causal>
                                }
                            </order>
                    }
                           <order>
                            <code>11</code>
                            <description>3956201313</description>
                            <orderType>
								<description></description>
							</orderType>
                           </order>
                    {
                        for $product in $customer/product
                        return
                            <product>{ $product/@*,$product/node() }</product>
                    }
                    {
                        for $bankingAccount in $customer/bankingAccount
                        return
                            <bankingAccount>{ $bankingAccount/@* , $bankingAccount/node() }</bankingAccount>
                    }
                    {
                        for $internalAccountBehavior in $customer/internalAccountBehavior
                        return
                            <internalAccountBehavior>{ $internalAccountBehavior/@* , $internalAccountBehavior/node() }</internalAccountBehavior>
                    }
                    <billingBehavior>
                        {
                            for $id in $customer/billingBehavior/id
                            return
                                <id>{ data($id) }</id>
                        }
                        {
                            for $code in $customer/billingBehavior/code
                            return
                                <code>{ data($code) }</code>
                        }
                        {
                            for $description in $customer/billingBehavior/description
                            return
                                <description>{ data($description) }</description>
                        }
                        {
                            for $creditCheckApproved in $customer/billingBehavior/creditCheckApproved
                            return
                                <creditCheckApproved>{ data($creditCheckApproved) }</creditCheckApproved>
                        }
                        {
                            for $scoreExpiryDate in $customer/billingBehavior/scoreExpiryDate
                            return
                                <scoreExpiryDate>{ data($scoreExpiryDate) }</scoreExpiryDate>
                        }
                        {
                            for $dateCreditBureauConsulted in $customer/billingBehavior/dateCreditBureauConsulted
                            return
                                <dateCreditBureauConsulted>{ data($dateCreditBureauConsulted) }</dateCreditBureauConsulted>
                        }
                        {
                            for $creditRefNumber in $customer/billingBehavior/creditRefNumber
                            return
                                <creditRefNumber>{ data($creditRefNumber) }</creditRefNumber>
                        }
                        {
                            for $evidentaAlreadyValid in $customer/billingBehavior/evidentaAlreadyValid
                            return
                                <evidentaAlreadyValid>{ data($evidentaAlreadyValid) }</evidentaAlreadyValid>
                        }
                        {
                            for $creditScoreCode in $customer/billingBehavior/creditScoreCode
                            return
                                <creditScoreCode>{ data($creditScoreCode) }</creditScoreCode>
                        }
                        {
                            for $creditScoreDescription in $customer/billingBehavior/creditScoreDescription
                            return
                                <creditScoreDescription>{ data($creditScoreDescription) }</creditScoreDescription>
                        }
                        {
                            for $status in $customer/billingBehavior/status
                            return
                                <status>{ $status/@* , $status/node() }</status>
                        }
                        
                                <highestDelayValue>99999</highestDelayValue>
                        {
                            for $timeDelayValue in $customer/billingBehavior/timeDelayValue
                            return
                                <timeDelayValue>{ data($timeDelayValue) }</timeDelayValue>
                        }
                        {
                            for $delayValue in $customer/billingBehavior/delayValue
                            return
                                <delayValue>{ data($delayValue) }</delayValue>
                        }
                    </billingBehavior>
                </customer>
                <salesMatrixResult>
                    <gama>gama</gama>
                    <plan>categoria plan</plan>
                    <linesNumber>10</linesNumber>
                </salesMatrixResult>
            </message>
        </ns4:WS_Result>
};

declare variable $retrieveLineStatisticsResponse1 as element(ns5:RetrieveLineStatisticsResponse) external;
declare variable $customer as element() external;

xf:getClientStatisticsLinesTemp_Res($retrieveLineStatisticsResponse1,
    $customer)
