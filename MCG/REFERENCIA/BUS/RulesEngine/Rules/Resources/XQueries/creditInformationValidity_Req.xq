(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_CREDITINFORMATIONVALIDITY.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_CREDITINFORMATIONVALIDITY_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/CreditInformationValidity/DS_CreditInformationValidity";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/creditInformationValidity";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/CreditInformationValidity2Fact/";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditInformationValidity_Req/";

declare function xf:creditInformationValidity_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name = "DS_CreditInformationValidity">
            <ns2:parameterList>
                <ns5:CreditInformationValidityFactRequest>
                    <CustomerBillingBehavior>{ $input_Parameters1/customerBillingBehavior/@* , $input_Parameters1/customerBillingBehavior/node() }</CustomerBillingBehavior>
                </ns5:CreditInformationValidityFactRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:creditInformationValidity_Req($input_Parameters1)