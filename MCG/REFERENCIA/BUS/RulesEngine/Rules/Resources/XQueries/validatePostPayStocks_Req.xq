(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns6:Input_Parameters" location="../Schemas/PS_VALIDATEPOSTPAYSTOCKS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_VALIDATEPOSTPAYSTOCKS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://xmlns.oracle.com/ValidatePostPayStocks/DS_ValidatePostPayStocks";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/ValidatePostPayStocksFact";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/validatePostPayStocks";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validatePostPayStocks_Req/";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";

declare function xf:validatePostPayStocks_Req($input_Parameters1 as element(ns6:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name = "DS_ValidatePostPayStocks">
            <ns1:parameterList>
                <ns0:ValidatePostPayStocksFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                    <SalesChannel>{ $input_Parameters1/salesChannel/@* , $input_Parameters1/salesChannel/node() }</SalesChannel>
                </ns0:ValidatePostPayStocksFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns6:Input_Parameters) external;

xf:validatePostPayStocks_Req($input_Parameters1)
