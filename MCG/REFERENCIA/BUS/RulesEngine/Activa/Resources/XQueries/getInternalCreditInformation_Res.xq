(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_GET_INTERNALINFORMATIONCREDIT.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$customer1" type="ns5:Input_Parameters/customer" location="../Schemas/PS_GET_INTERNALCREDITINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns5:WS_Result" location="../Schemas/PS_GET_INTERNALCREDITINFORMATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_INTERNALINFOCREDIT/";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/getInternalCreditInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getInternalCreditInformation_Res/";

declare function xf:getInternalCreditInformation_Res($outputParameters1 as element(ns0:OutputParameters),
    $customer1 as element())
    as element(ns5:WS_Result) {
        <ns5:WS_Result>
            <code>1</code>
            <message>
                <customerBillingBehavior>
                    {
                        for $id in $customer1/billingBehavior/id
                        return
                            <id>{ data($id) }</id>
                    }
                    {
                        for $code in $customer1/billingBehavior/code
                        return
                            <code>{ data($code) }</code>
                    }
                    {
                        for $P_PRODUCTO in $outputParameters1/ns0:P_PRODUCTO
                        return
                            <description>{ data($P_PRODUCTO) }</description>
                    }
                    {
                        for $creditCheckApproved in $customer1/billingBehavior/creditCheckApproved
                        return
                            <creditCheckApproved>{ data($creditCheckApproved) }</creditCheckApproved>
                    }
                    {
                        for $scoreExpiryDate in $customer1/billingBehavior/scoreExpiryDate
                        return
                            <scoreExpiryDate>{ data($scoreExpiryDate) }</scoreExpiryDate>
                    }
                    {
                        for $dateCreditBureauConsulted in $customer1/billingBehavior/dateCreditBureauConsulted
                        return
                            <dateCreditBureauConsulted>{ data($dateCreditBureauConsulted) }</dateCreditBureauConsulted>
                    }
                    {
                        for $creditRefNumber in $customer1/billingBehavior/creditRefNumber
                        return
                            <creditRefNumber>{ data($creditRefNumber) }</creditRefNumber>
                    }
                    {
                        for $evidentaAlreadyValid in $customer1/billingBehavior/evidentaAlreadyValid
                        return
                            <evidentaAlreadyValid>{ data($evidentaAlreadyValid) }</evidentaAlreadyValid>
                    }
                    {
                        for $creditScoreCode in $customer1/billingBehavior/creditScoreCode
                        return
                            <creditScoreCode>{ data($creditScoreCode) }</creditScoreCode>
                    }
                    {
                        for $creditScoreDescription in $customer1/billingBehavior/creditScoreDescription
                        return
                            <creditScoreDescription>{ data($creditScoreDescription) }</creditScoreDescription>
                    }
                    {
                        for $status in $customer1/billingBehavior/status
                        return
                            <status>{ $status/@* , $status/node() }</status>
                    }
                    {
                        for $highestDelayValue in $customer1/billingBehavior/highestDelayValue
                        return
                            <highestDelayValue>{ data($highestDelayValue) }</highestDelayValue>
                    }
                    {
                        for $timeDelayValue in $customer1/billingBehavior/timeDelayValue
                        return
                            <timeDelayValue>{ data($timeDelayValue) }</timeDelayValue>
                    }
                    {
                        for $delayValue in $customer1/billingBehavior/delayValue
                        return
                            <delayValue>{ data($delayValue) }</delayValue>
                    }
                </customerBillingBehavior>
            </message>
            <description>Operacion Ejecutada</description>
        </ns5:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $customer1 as element() external;

xf:getInternalCreditInformation_Res($outputParameters1,
    $customer1)
