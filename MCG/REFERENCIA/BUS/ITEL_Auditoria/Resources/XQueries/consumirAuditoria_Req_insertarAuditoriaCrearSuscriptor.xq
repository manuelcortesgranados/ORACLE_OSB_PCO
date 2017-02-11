(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIACREARSUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERT_AUDITORIA_CREARSUSC/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaCrearSuscriptor/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaCrearSuscriptor($uuid as xs:decimal,
    $mensajeAuditoria as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_TRANSUUID>{ $uuid }</ns0:P_TRANSUUID>
            <ns0:P_FECHA_EVENTO>{ data($mensajeAuditoria/FECHA_IN) }</ns0:P_FECHA_EVENTO>
            <ns0:P_TRAMA_ENTRADA>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA_ENTRADA>
            <ns0:P_MIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_MIN>
            <ns0:P_CONTRACTO>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='CONTRATO']/VALOR) }</ns0:P_CONTRACTO>
            <ns0:P_CARGA_INICIAL>{ data($mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[./NOMBRE='CARGAINICIAL']/VALOR) }</ns0:P_CARGA_INICIAL>
        </ns0:InputParameters>
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;

xf:consumirAuditoria_Req_insertarAuditoriaCrearSuscriptor($uuid,
    $mensajeAuditoria)