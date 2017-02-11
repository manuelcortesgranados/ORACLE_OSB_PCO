(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIAGLOBAL.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_INSERTAR_AUDITORIA_GLOBAL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaGlobal/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaGlobal($mensajeAuditoria as element(ns1:Input_Parameters),
    $duracion as xs:decimal)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_USUARIO>{ data($mensajeAuditoria/USUARIO) }</ns0:P_USUARIO>
            <ns0:P_METODO>{ data($mensajeAuditoria/METODO) }</ns0:P_METODO>
            <ns0:P_IP>{ data($mensajeAuditoria/IP) }</ns0:P_IP>
            <ns0:P_HOST>{ data($mensajeAuditoria/HOST) }</ns0:P_HOST>
            <ns0:P_TRAMA_IN>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA_IN>
            <ns0:P_FECHA_IN>{ data($mensajeAuditoria/FECHA_IN) }</ns0:P_FECHA_IN>
            <ns0:P_MIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_MIN>
            <ns0:P_TRAMA_OUT>{ data($mensajeAuditoria/TRAMA_OUT) }</ns0:P_TRAMA_OUT>
            <ns0:P_FECHA_OUT>{ data($mensajeAuditoria/FECHA_OUT) }</ns0:P_FECHA_OUT>
            <ns0:P_TIEMPO_TENCOMEN>{ $duracion }</ns0:P_TIEMPO_TENCOMEN>
            <ns0:P_COD_RESPUESTA>{ data($mensajeAuditoria/COD_RESPUESTA) }</ns0:P_COD_RESPUESTA>
        </ns0:InputParameters>
};

declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;
declare variable $duracion as xs:decimal external;

xf:consumirAuditoria_Req_insertarAuditoriaGlobal($mensajeAuditoria,
    $duracion)