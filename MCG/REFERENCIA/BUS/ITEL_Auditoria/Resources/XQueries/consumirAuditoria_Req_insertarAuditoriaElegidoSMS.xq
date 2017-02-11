(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIAELEGIDOSMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERT_AUDITORIA_ELESMS/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaElegidoSMS/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaElegidoSMS($uuid as xs:decimal,
    $mensajeAuditoria as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) { 
    	let $fechaOperacion := if(data($mensajeAuditoria/METODO) = '704' or data($mensajeAuditoria/METODO) = '705'  ) then ()
    						   else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='COMENTARIO']/VALOR),
    		$codigoCobro :=	if(data($mensajeAuditoria/METODO) = '704' ) then () 
    						else if(data($mensajeAuditoria/METODO) = '701' or data($mensajeAuditoria/METODO) = '702' ) then 
    							data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR)
    						else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR),
    		$vigencia :=    if(data($mensajeAuditoria/METODO) = '701' or data($mensajeAuditoria/METODO) = '705') then
    							 data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='DIASVIGENCIA']/VALOR) 
    						else (),
    		$cuenta   :=   if(data($mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[NOMBRE='CODIGO_CUENTA']/VALOR) = '0') then 'smsFnFOnNet'
 						   else if(data($mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[NOMBRE='CODIGO_CUENTA']/VALOR) = '1') then 'smsFnFOffNet'
 						   else 'smsFnFAny'   													   		   
    		
    	return
        <ns0:InputParameters>	
            <ns0:P_TRANSUUID>{ $uuid }</ns0:P_TRANSUUID>
            <ns0:P_FECHA_EVENTO>{ data($mensajeAuditoria/FECHA_IN) }</ns0:P_FECHA_EVENTO>
            <ns0:P_TRAMA_ENTRADA>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA_ENTRADA>
            <ns0:P_MIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_MIN>
            <ns0:P_ELEGIDO>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR) }</ns0:P_ELEGIDO>
            <ns0:P_SUSCRIPCION>{ $cuenta }</ns0:P_SUSCRIPCION>
            <ns0:P_FECHA>{ $fechaOperacion }</ns0:P_FECHA>
            <ns0:P_COBRO>{ $codigoCobro }</ns0:P_COBRO>
            <ns0:P_VIGENCIA>{ $vigencia }</ns0:P_VIGENCIA>
        </ns0:InputParameters>
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;

xf:consumirAuditoria_Req_insertarAuditoriaElegidoSMS($uuid,
    $mensajeAuditoria)