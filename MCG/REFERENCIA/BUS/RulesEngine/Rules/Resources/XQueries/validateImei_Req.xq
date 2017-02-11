(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../Schemas/PS_VALIDATEIMEI.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_VALIDATEIMEI_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/ValidateImei/DS_ValidateImei";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/ValidateImeiFact";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/validateImei";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateImei_Req/";

declare function xf:validateImei_Req($input_Parameters1 as element(ns4:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name = "DS_ValidateImei">
            <ns2:parameterList>
                <ns1:ValidateImeiFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                </ns1:ValidateImeiFactRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:validateImei_Req($input_Parameters1)
