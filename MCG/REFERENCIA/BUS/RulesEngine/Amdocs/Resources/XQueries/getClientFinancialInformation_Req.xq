(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_GET_CLIENTFINANCIALINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns3:AR7CreditEvaluationRequest" location="../Schemas/BS_GET_CREDITEVALUATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/getClientFinancialInformation";
declare namespace ns3 = "http://ar7creditevaluation.customerorder.schema.amx.com";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xs = "http://www.w3.org/2001/XMLSchema";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getClientFinancialInformation_Req/";

declare function xf:getClientFinancialInformation_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:AR7CreditEvaluationRequest) {
        <ns3:AR7CreditEvaluationRequest>
            <ns3:customerNo>{ xs:long(data($input_Parameters1/customer/document/identifierNumber) )}</ns3:customerNo>
            {
                for $product in $input_Parameters1/customer/product,
                    $number in $product/number
                return
                    <ns3:msisdn>{ xs:string(data($number)) }</ns3:msisdn>
            }
        </ns3:AR7CreditEvaluationRequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:getClientFinancialInformation_Req($input_Parameters1)
