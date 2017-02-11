(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_GET_RADICATEDMAACACTIVA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_GET_RADICATEDMAACACTIVA.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_RADICATED_MAAC_ACTIVA/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierPartnerDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getRadicatedMaacActiva";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getRadicatedMaacActiva_Req/";

declare function xf:getRadicatedMaacActiva_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_NUMBER_RADICATED>{ data($input_Parameters1/creditReference/creditRefNumber) }</ns1:P_NUMBER_RADICATED>
            <ns1:P_CODE_DISTRIBUTOR>{ data($input_Parameters1/customer/product[1]/supplier/code) }</ns1:P_CODE_DISTRIBUTOR>
            <ns1:P_NUMBER_REGION>{ data($input_Parameters1/customer/location/costCenterRegion/code) }</ns1:P_NUMBER_REGION>
            <ns1:P_TIPO_ID>{ data($input_Parameters1/customer/document/type/code) }</ns1:P_TIPO_ID>
            <ns1:P_IDENTIFICACION>{ data($input_Parameters1/customer/document/identifierNumber) }</ns1:P_IDENTIFICACION>
            (: <ns1:P_DAYS_CONFIGURED>{ data($input_Parameters1/parameterCollection/parameter[name='creditInformationExpiration']/value) }</ns1:P_DAYS_CONFIGURED>:)
            <ns1:P_DAYS_CONFIGURED>350</ns1:P_DAYS_CONFIGURED>
            <ns1:P_ID_PROCESO>{ data($input_Parameters1/customer/order/id) }</ns1:P_ID_PROCESO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:getRadicatedMaacActiva_Req($input_Parameters1)