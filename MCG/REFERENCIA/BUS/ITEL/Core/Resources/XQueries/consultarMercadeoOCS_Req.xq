(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_MERCADEO_OCS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_MERCADEO_OCS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_MERCADEO_OCS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarMercadeoOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarMercadeoOCS_Req/";

declare function xf:consultarMercadeoOCS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CODMATERIAL>{ data($input_Parameters1/CODIGO_MATERIAL) }</ns1:P_CODMATERIAL>
            <ns1:P_TMCODE>{ data($input_Parameters1/TMCODE) }</ns1:P_TMCODE>
            <ns1:P_SPCODE>{ data($input_Parameters1/SPCODE) }</ns1:P_SPCODE>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarMercadeoOCS_Req($input_Parameters1)