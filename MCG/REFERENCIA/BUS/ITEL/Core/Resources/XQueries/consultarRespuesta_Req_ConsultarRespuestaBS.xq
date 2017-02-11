(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRESPUESTA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARRESPUESTA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RESPUESTAS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRespuesta/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarRespuesta_Req_ConsultarRespuestaBS/";

declare function xf:consultarRespuesta_Req_ConsultarRespuestaBS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_RESCODIGO>{ data($input_Parameters1/RESCODIGO) }</ns1:P_RESCODIGO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarRespuesta_Req_ConsultarRespuestaBS($input_Parameters1)