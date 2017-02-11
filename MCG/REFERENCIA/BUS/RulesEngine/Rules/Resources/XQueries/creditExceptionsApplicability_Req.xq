(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns3:Input_Parameters" location="../Schemas/PS_CREDITEXCEPTIONSAPPLICABILITY.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_CREDITEXCEPTIONSAPPLICABILITY_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/CreditExceptionsApplicability/DS_CreditExceptionsApplicability";
declare namespace ns1 = "http://xmlns.oracle.com/bpel";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/creditExceptionsApplicability";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/CreditExceptionsApplicabilityFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditExceptionsApplicability_Req/";

declare function xf:creditExceptionsApplicability_Req($input_Parameters as element(ns3:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name="DS_CreditExceptionsApplicability">
            <ns2:parameterList>
                <ns0:CreditExceptionsApplicabilityFactRequest>
                    <SalesChannel>{ $input_Parameters/salesChannel/@* , $input_Parameters/salesChannel/node() }</SalesChannel>
                </ns0:CreditExceptionsApplicabilityFactRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters as element(ns3:Input_Parameters) external;

xf:creditExceptionsApplicability_Req($input_Parameters)
