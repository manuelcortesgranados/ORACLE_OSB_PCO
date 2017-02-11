(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns3:Input_Parameters" location="../Schemas/PS_HASCREDITREFERENCENUMBREMAAC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../Schemas/BR_HASCREDITREFERENCENUMBREMAAC_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/HasCreditReferenceNumberMAACFact/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/hasCreditReferenceNumberMAAC";
declare namespace ns0 = "http://xmlns.oracle.com/HasCreditReferenceNumberMAAC/DS_HasCreditReferenceNumberMAAC";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/hasCreditReferenceNumberMAAC_Req/";

declare function xf:hasCreditReferenceNumberMAAC_Req($input_Parameters as element(ns3:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name = "DS_HasCreditReferenceNumberMAAC">
            <ns0:parameterList>
                <ns4:HasCreditReferenceNumberMAACFactRequest>
                    <CreditReference>{ $input_Parameters/creditReference/@* , $input_Parameters/creditReference/node() }</CreditReference>
                </ns4:HasCreditReferenceNumberMAACFactRequest>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters as element(ns3:Input_Parameters) external;

xf:hasCreditReferenceNumberMAAC_Req($input_Parameters)
