(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_GET_INTERNALEVIDENTINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns2:InputParameters" location="../Schemas/BD_GET_INTERNALINFOEVIDENT.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_INTERNALINFOEVIDENT/";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierPartnerDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getInternalEvidentInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getInternalEvidentInformation_Req/";

declare function xf:getInternalEvidentInformation_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:InputParameters) {
        <ns2:InputParameters>
            <ns2:P_DOCUMENT_NUMBER>{ data($input_Parameters1/customer/document/identifierNumber) }</ns2:P_DOCUMENT_NUMBER>
            <ns2:P_DOCUMENT_TYPE>{ data($input_Parameters1/customer/document/type/code) }</ns2:P_DOCUMENT_TYPE>
            <ns2:P_DISTRIBUTOR_CODE>{ data($input_Parameters1/supplier/code) }</ns2:P_DISTRIBUTOR_CODE>
            <ns2:P_DAYS_CONFIGURED>{ data($input_Parameters1/parameterCollection/parameter[name='creditInformationExpiration']/value) }</ns2:P_DAYS_CONFIGURED>
        </ns2:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:getInternalEvidentInformation_Req($input_Parameters1)