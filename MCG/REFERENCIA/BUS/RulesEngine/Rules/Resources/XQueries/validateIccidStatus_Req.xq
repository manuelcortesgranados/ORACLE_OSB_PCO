(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_VALIDATEICCIDSTATUS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_VALIDATEICCIDSTATUS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://xmlns.oracle.com/ValidateICCIDStatus/DS_ValidateICCIDStatus";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/ValidateICCIDStatusFact/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/validateIccidStatus";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateIccidStatus_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";

declare function xf:validateIccidStatus_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless>
            <ns1:parameterList>
                <ns4:ValidateICCIDStatusFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                </ns4:ValidateICCIDStatusFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:validateIccidStatus_Req($input_Parameters1)
