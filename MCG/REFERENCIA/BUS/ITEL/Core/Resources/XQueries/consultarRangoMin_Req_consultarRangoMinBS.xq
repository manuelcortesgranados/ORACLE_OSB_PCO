(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARRANGOMIN.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RANGO_MIN/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarRangoMin_Req_consultarRangoMinBS/";

declare function xf:consultarRangoMin_Req_consultarRangoMinBS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($input_Parameters1/MIN) }</ns1:P_MIN>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarRangoMin_Req_consultarRangoMinBS($input_Parameters1)