(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_GET_INTERNALCREDITINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_GET_INTERNALINFORMATIONCREDIT.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/getInternalCreditInformation";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_INTERNALINFOCREDIT/";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getInternalCreditInformation_Req/";

declare function xf:getInternalCreditInformation_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_CUSTOMER>{ data($input_Parameters1/customer/document/identifierNumber) }</ns0:P_CUSTOMER>
            {
                for $code in $input_Parameters1/customer/document/type/code
                return
                    <ns0:P_CUSTOMER_DOCUMENT_TYPE>{ data($code) }</ns0:P_CUSTOMER_DOCUMENT_TYPE>
            }
            <ns0:P_DAYS_CONFIGURED>{ data($input_Parameters1/parameterCollection/parameter[name='creditInformationExpiration']/value) }</ns0:P_DAYS_CONFIGURED>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:getInternalCreditInformation_Req($input_Parameters1)
