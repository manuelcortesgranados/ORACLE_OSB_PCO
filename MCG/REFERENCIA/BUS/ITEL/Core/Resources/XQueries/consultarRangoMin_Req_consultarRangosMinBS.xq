(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTARRANGOSMIN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RANGOS_MIN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRangoMin_Req_consultarRangosMinBS/";

declare function xf:consultarRangoMin_Req_consultarRangosMinBS($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ substring(data($input_Parameters/MIN), 1, 6) }</ns0:P_MIN>
        </ns0:InputParameters>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:consultarRangoMin_Req_consultarRangosMinBS($input_Parameters)