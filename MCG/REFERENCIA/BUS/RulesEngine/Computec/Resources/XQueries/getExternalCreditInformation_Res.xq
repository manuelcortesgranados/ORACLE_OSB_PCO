(:: pragma bea:global-element-parameter parameter="$informe" element="informe" location="../Schemas/informe.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$customer" type="ns4:Input_Parameters/customer" location="../Schemas/PS_GET_EXTERNALCREDITINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_GET_EXTERNALCREDITINFORMATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getExternalCreditInformation";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Computec/Resources/XQueries/getExternalCreditInformation_Res/";

declare function xf:getExternalCreditInformation_Res($informe as element(informe),
    $customer as element())
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
            <code>1</code>
            <message>
                <customerBillingBehavior>
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
                        for $clasificacion in $informe/score[1]/@clasificacion
                        return
                            <description>{ data($clasificacion) }</description>
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
                    {
                        for $highestDelayValue in $customer/billingBehavior/highestDelayValue
                        return
                            <highestDelayValue>{ data($highestDelayValue) }</highestDelayValue>
                    }
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
                </customerBillingBehavior>
            </message>
        </ns4:WS_Result>
};

declare variable $informe as element(informe) external;
declare variable $customer as element() external;

xf:getExternalCreditInformation_Res($informe,
    $customer)
