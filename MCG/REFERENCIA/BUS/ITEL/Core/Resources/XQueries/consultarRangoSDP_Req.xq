(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRANGOSDP.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_RANGOSDP.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoSDP/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RANGO_SDP/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRangosSDP_Req/";

declare function xf:consultarRangosSDP_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarRangosSDP_Req($input_Parameters1)