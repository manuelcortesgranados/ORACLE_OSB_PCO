(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIASEGUNDOELEGIDO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERT_AUDITORIA_SELEGIDO/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaSegundoElegido/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaSegundoElegido($uuid as xs:decimal,
    $mensajeAuditoria as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_TRANSUUID>{ $uuid }</ns0:P_TRANSUUID>
            <ns0:P_FECHA_EVENTO>{ data($mensajeAuditoria/FECHA_IN) }</ns0:P_FECHA_EVENTO>
            <ns0:P_TRAMA_ENTRADA>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA_ENTRADA>
            <ns0:P_MIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_MIN>
            <ns0:P_ELEGIDO>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR) }</ns0:P_ELEGIDO>
            <ns0:P_VIGENCIA>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR) }</ns0:P_VIGENCIA>
        </ns0:InputParameters>
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;

xf:consumirAuditoria_Req_insertarAuditoriaSegundoElegido($uuid,
    $mensajeAuditoria)