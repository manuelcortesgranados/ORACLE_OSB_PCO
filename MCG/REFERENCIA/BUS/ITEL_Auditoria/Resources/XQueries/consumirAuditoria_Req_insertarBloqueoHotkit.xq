(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_BLOQUEO_HOTKIT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_BLOQUEO_HOTKIT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarBloqueoHotkit_Req/";

declare function xf:insertarBloqueoHotkit_Req($uuid as xs:decimal,
    $mensajeAuditoria as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_MIN>
            <ns0:P_TRAMA>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA>
            <ns0:P_NUMREPORTE>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR) }</ns0:P_NUMREPORTE>
            <ns0:P_TRANSUUID>{ $uuid }</ns0:P_TRANSUUID>
        </ns0:InputParameters>
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;

xf:insertarBloqueoHotkit_Req($uuid,
    $mensajeAuditoria)