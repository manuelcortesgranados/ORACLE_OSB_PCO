(:: pragma  parameter="$report" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_INSERT_INTERNALINFOCREDIT.xsd" ::)

declare namespace ns0 = "http://www.claro.com.co/rulesEngine/insertInternalCreditInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/insertInternalCreditInformationPS_Req/";

declare function xf:insertInternalCreditInformationPS_Req($report as element(*),
    $documentType as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <report>{$report}</report>
            <customerDocumentType>{ $documentType }</customerDocumentType>
        </ns0:Input_Parameters>
};

declare variable $report as element(*) external;
declare variable $documentType as xs:string external;

xf:insertInternalCreditInformationPS_Req($report,
    $documentType)
