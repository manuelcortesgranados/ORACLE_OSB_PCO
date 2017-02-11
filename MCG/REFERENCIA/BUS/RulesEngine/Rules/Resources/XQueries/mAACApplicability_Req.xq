(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns3:Input_Parameters" location="../Schemas/PS_MAACAPPLICABILITY.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_MAACAPPLICABILITY_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/MAACApplicability/DS_MAACApplicability";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/mAACApplicability";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/MAACApplicabilityFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/mAACApplicability_Req/";

declare function xf:mAACApplicability_Req($input_Parameters as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="DS_MAACApplicability">
            <ns1:parameterList>
                <ns0:MAACApplicabilityFactRequest>
                    <SalesChannel>{ $input_Parameters/salesChannel/@* , $input_Parameters/salesChannel/node() }</SalesChannel>
                </ns0:MAACApplicabilityFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters as element(ns3:Input_Parameters) external;

xf:mAACApplicability_Req($input_Parameters)