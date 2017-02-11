(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns6:Input_Parameters" location="../Schemas/PS_VALIDATEIMEIINLISTS.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_VALIDATEIMEIINLISTS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/ValidateImeiInLists/DS_ValidateImeiInLists";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/ValidateImeiFact";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateImeiInLists_Req/";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/validateImeiInLists";
declare namespace ns7 = "http://xmlns.oracle.com/bpel";

declare function xf:validateImeiInLists_Req($input_Parameters1 as element(ns6:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless>
            <ns2:parameterList>
                <ns4:ValidateImeiInListsFactRequest>
                    <product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</product>
                </ns4:ValidateImeiInListsFactRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns6:Input_Parameters) external;

xf:validateImeiInLists_Req($input_Parameters1)
