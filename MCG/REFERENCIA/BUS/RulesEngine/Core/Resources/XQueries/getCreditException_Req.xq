(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_GET_CREDIT_EXCEPTION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_GET_CREDIT_EXCEPTION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/getCreditException";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/getCreditExceptions";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/getCreditExceptions_Req/";

declare function xf:getCreditExceptions_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            {
                for $order in $input_Parameters1/customerOrder[1]/id
                return
                    <ns1:P_ORDER_ID>{ data($order) }</ns1:P_ORDER_ID>
            }
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:getCreditExceptions_Req($input_Parameters1)
