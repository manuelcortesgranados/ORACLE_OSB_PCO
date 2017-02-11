(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_AUDITORIA_BLOQUEO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_AUDITORIA_BLOQUEO/";
declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaBloqueo/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaBloqueo($uuid as xs:decimal, $mensajeAuditoria as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
    	let $bloqueofraude := data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR),
    		$bloqueootro := data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR)
    	return
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns1:P_MIN>
            <ns1:P_TRAMA>{ data($mensajeAuditoria/TRAMA_IN) }</ns1:P_TRAMA>
            <ns1:P_BLOQUEOFRAUDE>{ if(fn:exists($bloqueofraude)) then $bloqueofraude else "0" }</ns1:P_BLOQUEOFRAUDE>
            <ns1:P_BLOQUEOOTRO>{ if(fn:exists($bloqueootro)) then $bloqueootro else "0" }</ns1:P_BLOQUEOOTRO>
            <ns1:P_TRANSUUID>{ $uuid }</ns1:P_TRANSUUID>
        </ns1:InputParameters>
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns0:Input_Parameters) external;

xf:consumirAuditoria_Req_insertarAuditoriaBloqueo($uuid, $mensajeAuditoria)