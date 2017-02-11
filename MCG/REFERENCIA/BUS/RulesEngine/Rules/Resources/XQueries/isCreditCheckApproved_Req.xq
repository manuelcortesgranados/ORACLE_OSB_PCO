(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns5:Input_Parameters" location="../Schemas/PS_ISCREDITCHECKAPPROVED.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../Schemas/BR_ISCREDITCHECKAPPROVED_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/CreditCheckApprovedFact/";
declare namespace ns0 = "http://xmlns.oracle.com/IsCreditCheckApproved/DS_IsCreditCheckApproved";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/isCreditCheckApproved";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/isCreditCheckApproved_Req/";

declare function xf:isCreditCheckApproved_Req($input_Parameters1 as element(ns5:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name="DS_IsCreditCheckApproved">
            <ns0:parameterList>
                <ns3:CreditCheckApprovedFactRequest>
                    <CustomerBillingBehavior>{ $input_Parameters1/customerBillingBehavior/@* , $input_Parameters1/customerBillingBehavior/node() }</CustomerBillingBehavior>
                </ns3:CreditCheckApprovedFactRequest>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns5:Input_Parameters) external;

xf:isCreditCheckApproved_Req($input_Parameters1)
