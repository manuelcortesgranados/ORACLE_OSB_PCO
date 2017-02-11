(:: pragma bea:global-element-parameter parameter="$aR7CreditEvaluationResponse1" element="ns3:AR7CreditEvaluationResponse" location="../Schemas/BS_GET_CREDITEVALUATION.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$customer" type="ns2:Input_Parameters/customer" location="../Schemas/PS_GET_CLIENTFINANCIALINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_GET_CLIENTFINANCIALINFORMATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/getClientFinancialInformation";
declare namespace ns3 = "http://ar7creditevaluation.customerorder.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getClientFinancialInformation_Res/";

declare function xf:getClientFinancialInformation_Res($aR7CreditEvaluationResponse1 as element(ns3:AR7CreditEvaluationResponse),
    $customer as element())
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
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
                            <order>{ $order/@* , $order/node() }</order>
                    }
                    {
                        for $product in $customer/product
                        return
                            <product/>
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
                    {
                        for $Ar7CreditEvaluationInfo in $aR7CreditEvaluationResponse1/ns3:Ar7CreditEvaluationInfo
                        return
                            <internalAccountBehavior>
                            	<description>{ data($Ar7CreditEvaluationInfo/ns3:l7Msisdn) }</description>
                            	<accountNumber>{ data($Ar7CreditEvaluationInfo/ns3:accountId) }</accountNumber>
                                <delayAmount>{ data($Ar7CreditEvaluationInfo/ns3:dueAmount) }</delayAmount>
                                <behaviorCustomer>{ data($Ar7CreditEvaluationInfo/ns3:l7CustPymBehavior) }</behaviorCustomer>
                                <seniority>{ data($Ar7CreditEvaluationInfo/ns3:l7SubSeniority) }</seniority>
                            </internalAccountBehavior>
                    }
                    {
                        for $billingBehavior in $customer/billingBehavior
                        return
                            <billingBehavior>{ $billingBehavior/@* , $billingBehavior/node() }</billingBehavior>
                    }
                    {
                        for $acknowledgement in $customer/acknowledgement
                        return
                            <acknowledgement>{ $acknowledgement/@* , $acknowledgement/node() }</acknowledgement>
                    }
                </customer>
            </message>
        </ns2:WS_Result>
};

declare variable $aR7CreditEvaluationResponse1 as element(ns3:AR7CreditEvaluationResponse) external;
declare variable $customer as element() external;

xf:getClientFinancialInformation_Res($aR7CreditEvaluationResponse1,
    $customer)
