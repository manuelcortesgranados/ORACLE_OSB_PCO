(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns3:Input_Parameters" location="../Schemas/PS_SALESMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_SALESMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/SalesMatrix/DS_SalesMatrix";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/salesMatrix";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/SalesMatrixFact";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/salesMatrix_Req/";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";

declare function xf:salesMatrix_Req($input_Parameters as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="DS_SalesMatrix">
            <ns1:parameterList>
                <ns5:SalesMatrixFactRequest>
                    <CustomerBillingBehavior>{ $input_Parameters/customerBillingBehavior/@* , $input_Parameters/customerBillingBehavior/node() }</CustomerBillingBehavior>
                    <SalesChannel>{ $input_Parameters/salesChannel/@* , $input_Parameters/salesChannel/node() }</SalesChannel>
                </ns5:SalesMatrixFactRequest>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters as element(ns3:Input_Parameters) external;

xf:salesMatrix_Req($input_Parameters)