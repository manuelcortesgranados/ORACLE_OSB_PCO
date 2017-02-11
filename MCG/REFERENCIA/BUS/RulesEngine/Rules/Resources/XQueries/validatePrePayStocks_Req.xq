(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_VALIDATEPREPAYSTOCKS.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../Schemas/BR_VALIDATEPREPAYSTOCKS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://xmlns.oracle.com/ValidatePrePayStocks/DS_ValidatePrePayStocks";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/validatePrePayStocks";
declare namespace ns5 = "http://xmlns.oracle.com/bpel";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/ValidatePrePayStocksFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validatePrePayStocks/";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";

declare function xf:validatePrePayStocks($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name = "DS_ValidatePrePayStocks">
            <ns3:parameterList>
                <ns6:ValidatePrePayStocksFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                    <SalesChannel>{ $input_Parameters1/salesChannel/@* , $input_Parameters1/salesChannel/node() }</SalesChannel>
                </ns6:ValidatePrePayStocksFactRequest>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:validatePrePayStocks($input_Parameters1)
