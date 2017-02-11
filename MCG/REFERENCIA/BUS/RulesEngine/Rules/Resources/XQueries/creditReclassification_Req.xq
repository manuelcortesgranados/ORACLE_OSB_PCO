(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns7:Input_Parameters" location="../Schemas/PS_CREDITRECLASSIFICATION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../Schemas/BR_CREDITRECLASSIFICATION_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/CreditReclassifcationFact/";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns0 = "http://xmlns.oracle.com/CreditReclassification/DS_CreditReclassification";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditReclassification_Req/";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/creditReclassification";

declare function xf:creditReclassification_Req($input_Parameters1 as element(ns7:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name = "DS_CreditReclassification">
            <ns0:parameterList>
                <ns2:CreditReclassifcationFactRequest>
                    <CustomerBillingBehavior>{ $input_Parameters1/customer/billingBehavior/@* , $input_Parameters1/customer/billingBehavior/node() }</CustomerBillingBehavior>
                    {
                        for $internalAccountBehavior in $input_Parameters1/customer/internalAccountBehavior
                        return
                            <InternalAccountBehavior>{ $internalAccountBehavior/@* , $internalAccountBehavior/node() }</InternalAccountBehavior>
                    }
                </ns2:CreditReclassifcationFactRequest>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns7:Input_Parameters) external;

xf:creditReclassification_Req($input_Parameters1)
