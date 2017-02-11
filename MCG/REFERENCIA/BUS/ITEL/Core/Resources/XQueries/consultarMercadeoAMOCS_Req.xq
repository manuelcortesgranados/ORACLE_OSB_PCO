(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_MERCADEO_AMD_OCS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_MERCADEO_AMD_OCS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_MERCADEO_AMD_OCS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarMercadeoAMOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarMercadeoAMOCS_Req/";

declare function xf:consultarMercadeoAMOCS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CODMATERIAL>{ data($input_Parameters1/CODIGO_MATERIAL) }</ns1:P_CODMATERIAL>
            <ns1:P_OFFER>{ data($input_Parameters1/OFFER) }</ns1:P_OFFER>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarMercadeoAMOCS_Req($input_Parameters1)