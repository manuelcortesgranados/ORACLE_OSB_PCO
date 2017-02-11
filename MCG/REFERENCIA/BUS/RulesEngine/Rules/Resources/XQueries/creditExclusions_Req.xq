(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_CREDITEXCLUSIONS.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../Schemas/BR_CREDITEXCLUSIONS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://xmlns.oracle.com/CreditExclusions/DS_CreditExclusions";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/creditExclusions";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/CreditExclusionsFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditExclusions_Req/";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns7 = "http://xmlns.oracle.com/bpel";
declare namespace ns8 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";

declare function xf:creditExclusions_Req($input_Parameters as element(ns0:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless name = "DS_CreditExclusions">
            <ns3:parameterList>
                <ns5:CreditExclusionsFactRequest>
                    <ExceptionBusinessCollection>{ $input_Parameters/exceptionBusinessCollection/@* , $input_Parameters/exceptionBusinessCollection/node() }</ExceptionBusinessCollection>
                    <Customer>{ $input_Parameters/customer/@* , $input_Parameters/customer/node() }</Customer>
                    <SalesChannel>{ $input_Parameters/salesChannel/@* , $input_Parameters/salesChannel/node() }</SalesChannel>
                </ns5:CreditExclusionsFactRequest>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:creditExclusions_Req($input_Parameters)
