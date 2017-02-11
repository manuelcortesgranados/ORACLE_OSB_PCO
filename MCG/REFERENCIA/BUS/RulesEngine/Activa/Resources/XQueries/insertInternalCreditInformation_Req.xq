(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_INSERT_INTERNALINFOCREDIT.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_INSERT_INTERNALINFOCREDIT.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/insertInternalInfoCredit";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/insertInternalCreditInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/insertInternalCreditInformation_Req/";

declare function xf:insertInternalCreditInformation_Req($input_Parameters as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            {
                let $report := $input_Parameters/report
                return
                    <ns1:P_REPORT>{$report/node()}</ns1:P_REPORT>
            }
            <ns1:P_CUSTOMER_DOCUMENT_TYPE>{ data($input_Parameters/customerDocumentType) }</ns1:P_CUSTOMER_DOCUMENT_TYPE>
        </ns1:InputParameters>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:insertInternalCreditInformation_Req($input_Parameters)
