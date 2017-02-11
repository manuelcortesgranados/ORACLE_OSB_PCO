(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIACAMBIOMIN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_INSERT_AUDITORIA_CAMBIOMIN/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaCambioMin/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaCambioMin($uuid as xs:decimal,
    $mensajeAuditoria as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_TRANSUUID>{ $uuid }</ns0:P_TRANSUUID>
            <ns0:P_FECHA_EVENTO>{ data($mensajeAuditoria/FECHA_IN) }</ns0:P_FECHA_EVENTO>
            <ns0:P_TRAMA_ENTRADA>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA_ENTRADA>
            <ns0:P_EVCMIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_EVCMIN>
            <ns0:P_EVCMINNUEVO>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[./NOMBRE='MINORIGEN']/VALOR) }</ns0:P_EVCMINNUEVO>
        </ns0:InputParameters>
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;

xf:consumirAuditoria_Req_insertarAuditoriaCambioMin($uuid,
    $mensajeAuditoria)