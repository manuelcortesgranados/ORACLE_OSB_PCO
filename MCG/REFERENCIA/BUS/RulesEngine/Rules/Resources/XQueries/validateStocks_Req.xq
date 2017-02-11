(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_VALIDATESTOCKS.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../Schemas/BR_VALIDATESTOCKS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://xmlns.oracle.com/ValidateStocks/DS_ValidateStocks";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/validateStocks";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/ValidateStocksFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateStocks_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";

declare function xf:validateStocks_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless>
            <ns3:parameterList>
                <ns5:ValidateStocksFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                </ns5:ValidateStocksFactRequest>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:validateStocks_Req($input_Parameters1)
