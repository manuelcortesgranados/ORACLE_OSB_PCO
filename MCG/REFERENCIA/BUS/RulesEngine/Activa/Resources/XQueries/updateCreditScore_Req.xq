(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns5:Input_Parameters" location="../Schemas/PS_UPDATE_CREDITSCORE.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_UPDATE_CREDITSCORE.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_updateCreditScore";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/updateCreditScore";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/updateCreditScore_Req/";

declare function xf:updateCreditScore_Req($input_Parameters1 as element(ns5:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            {
                for $identifierNumber in $input_Parameters1/customer/document/identifierNumber
                return
                    <ns1:P_CUSTOMER>{ data($identifierNumber) }</ns1:P_CUSTOMER>
            }
            {
                for $code0 in $input_Parameters1/customer/document/type/code
                return
                    <ns1:P_CUSTOMER_DOCUMENT_TYPE>{ data($code0) }</ns1:P_CUSTOMER_DOCUMENT_TYPE>
            }
            {
                for $description in $input_Parameters1/customer/billingBehavior/description
                return
                    <ns1:P_SCORE>{ data($description) }</ns1:P_SCORE>
            }
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns5:Input_Parameters) external;

xf:updateCreditScore_Req($input_Parameters1)
