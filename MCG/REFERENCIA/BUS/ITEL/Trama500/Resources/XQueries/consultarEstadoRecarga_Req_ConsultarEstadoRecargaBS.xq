(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARESTADORECARGA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARESTADORECARGA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_ESTADORECARGA/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarEstadoRecarga/";
declare namespace xf = "http://tempuri.org/ITEL/Trama500/Resources/XQueries/consultarEstadoRecarga_Req_ConsultarEstadoRecargaBS/";

declare function xf:consultarEstadoRecarga_Req_ConsultarEstadoRecargaBS($input_Parameters as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($input_Parameters/MIN) }</ns1:P_MIN>
            <ns1:P_HOST_ID>{ data($input_Parameters/HOST_ID) }</ns1:P_HOST_ID>
            <ns1:P_CONSECUTIVO>{ data($input_Parameters/CONSECUTIVO) }</ns1:P_CONSECUTIVO>
            <ns1:P_FECHA_RECARGA>{ data($input_Parameters/FECHA_RECARGA) }</ns1:P_FECHA_RECARGA>
        </ns1:InputParameters>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:consultarEstadoRecarga_Req_ConsultarEstadoRecargaBS($input_Parameters)