(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../Schemas/PS_VALIDATECFM.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_VALIDATECFM_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns1 = "http://xmlns.oracle.com/ValidateCfm/DS_ValidateCfm";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/validateCFM";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/ValidateCfmFact";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateCFM_Req/";

declare function xf:validateCFM_Req($input_Parameters1 as element(ns4:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "DS_ValidateCfm">
            <ns1:parameterList>
                <ns0:ValidateCfmFactRequest>
                    <Customer>{ $input_Parameters1/customer/@* , $input_Parameters1/customer/node() }</Customer>
                </ns0:ValidateCfmFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:validateCFM_Req($input_Parameters1)
