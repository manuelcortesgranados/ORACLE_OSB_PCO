(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_GET_STATUSICCIDACTIVA.xsd" ::)
(:: pragma bea:global-element-return element="ns2:InputParameters" location="../Schemas/BD_GETSTATUSICCIDACTIVA.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_RULESENGINE/PRC_GET_STATUS_ICCID_ACTIVA/";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/getStatusIccidActiva";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getStatusIccidActiva_Req/";

declare function xf:getStatusIccidActiva_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:InputParameters) {
        <ns2:InputParameters>
            <ns2:P_ICCID>{ data($input_Parameters1/product/code) }</ns2:P_ICCID>
        </ns2:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:getStatusIccidActiva_Req($input_Parameters1)