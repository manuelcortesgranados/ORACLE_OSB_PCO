(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIAELEGIDO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERT_AUDITORIA_ELEGIDO/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaElegido/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaElegido($uuid as xs:decimal,
    $mensajeAuditoria as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) { 
    	let $elegido := if(data($mensajeAuditoria/METODO) = '307' ) then data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR)
    						   else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='HOSTID']/VALOR),  
    		$fechaOperacion := if(data($mensajeAuditoria/METODO) = '304' ) then ()
    						   else if(data($mensajeAuditoria/METODO) = '307' ) then data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='COMENTARIO']/VALOR) 
    						   else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR),
    		$codigoCobro :=	if(data($mensajeAuditoria/METODO) = '304' ) then () 
    						else if(data($mensajeAuditoria/METODO) = '307' ) then data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR)
    						else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR),
    		$vigencia := if(data($mensajeAuditoria/METODO) = '304' ) then () 
    						else if(data($mensajeAuditoria/METODO) = '308' ) then data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='VIGENCIA']/VALOR)
    						else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='DIASVIGENCIA']/VALOR)			   		   
    		
    	return
        <ns0:InputParameters>	
            <ns0:P_TRANSUUID>{ $uuid }</ns0:P_TRANSUUID>
            <ns0:P_FECHA_EVENTO>{ data($mensajeAuditoria/FECHA_IN) }</ns0:P_FECHA_EVENTO>
            <ns0:P_TRAMA_ENTRADA>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA_ENTRADA>
            <ns0:P_MIN>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_MIN>
            <ns0:P_ELEGIDO>{ $elegido }</ns0:P_ELEGIDO>
            <ns0:P_FECHA_OPERACION>{ $fechaOperacion }</ns0:P_FECHA_OPERACION>
            <ns0:P_COBRO>{ $codigoCobro }</ns0:P_COBRO>
            <ns0:P_VIGENCIA>{ $vigencia }</ns0:P_VIGENCIA>
        </ns0:InputParameters>
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;

xf:consumirAuditoria_Req_insertarAuditoriaElegido($uuid,
    $mensajeAuditoria)