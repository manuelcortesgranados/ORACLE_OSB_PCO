(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIARECARGA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_INSERTAR_AUDITORIA_RECARGA/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_insertarAuditoriaRecarga/";

declare function xf:consumirAuditoria_Req_insertarAuditoriaRecarga($uuid as xs:string,
    $mensajeAuditoria as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
    	let $nombre := if(data($mensajeAuditoria/METODO)= '400') then 'MONTOONPEAK' else if(data($mensajeAuditoria/METODO)= '402') then 'MONTOONPEAKDESTINO'  else if(data($mensajeAuditoria/METODO)= ('405','406')) then 'MONTOCUENTA' else 'MONTOONPEAK' 
    	let $nodoMonto := $mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[./NOMBRE=$nombre]/VALOR
    	let $montoOCS := if(data($mensajeAuditoria/METODO)= ('400','405','406','408','411')) then data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR)
    					else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BALANCES']/VALOR/BALANCE[CUENTA='0']/VALOR)
    	let $monto :=  if(number($mensajeAuditoria/IN_DESTINO)< 50) then if (empty($nodoMonto)) then "0" else xf:normalizarNumero(data($nodoMonto))
    					else if (empty($montoOCS) or $montoOCS = "" ) then "0" else $montoOCS
	    let $montoBonoOCS := data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='BONO_OCS']/VALOR)    						 
    	let $nodoMontoBonos := $mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[./NOMBRE='MONTOBONOS']/VALOR
    	let $montoBonos := if(number($mensajeAuditoria/IN_DESTINO)< 50) then if (empty($nodoMontoBonos)) then "0" else xf:normalizarNumero(data($nodoMontoBonos))
    						else if (empty($montoBonoOCS) or $montoBonoOCS = "" ) then "0" else $montoBonoOCS 
        let $vigenciaOCS := if(data($mensajeAuditoria/METODO)= ('405','406')) then data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='DIASVIGENCIA']/VALOR)
        					else  
        						if( data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='VIGENCIA_OCS']/VALOR)= "" or
        						 empty($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='VIGENCIA_OCS']/VALOR) )  then "0"
        						 else data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[NOMBRE='VIGENCIA_OCS']/VALOR)	 						
    	return
        <ns0:InputParameters>
            <ns0:P_TRANSUUID>{ $uuid }</ns0:P_TRANSUUID>
            <ns0:P_FECHA_EVENTO>{ data($mensajeAuditoria/FECHA_IN) }</ns0:P_FECHA_EVENTO>
            <ns0:P_TRAMA_ENTRADA>{ data($mensajeAuditoria/TRAMA_IN) }</ns0:P_TRAMA_ENTRADA>
            <ns0:P_MIN_DESTINO>{ data($mensajeAuditoria/MIN_DESTINO) }</ns0:P_MIN_DESTINO>
            <ns0:P_MIN_ORIGEN>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[./NOMBRE='MINORIGEN']/VALOR) }</ns0:P_MIN_ORIGEN>
            <ns0:P_MONTO>{ $monto }</ns0:P_MONTO>
            <ns0:P_VIGENCIA>{ if(number($mensajeAuditoria/IN_DESTINO)< 50) then 
            						if(data($mensajeAuditoria/METODO)= ('405', '406')) then data($mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[./NOMBRE='VIGENCIACUENTA']/VALOR)
            						else data($mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[./NOMBRE='VIGENCIAONPEAK']/VALOR)
            				  else $vigenciaOCS
            					}
            </ns0:P_VIGENCIA>
            <ns0:P_COMENTARIO>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[./NOMBRE='COMENTARIO']/VALOR) }</ns0:P_COMENTARIO>
            <ns0:P_HOST_ID>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[./NOMBRE='HOSTID']/VALOR) }</ns0:P_HOST_ID>
            <ns0:P_CONSECUTIVO>{ data($mensajeAuditoria/PARAMETROS_TRAMA/PARAMETRO[./NOMBRE='CONSECUTIVO']/VALOR) }</ns0:P_CONSECUTIVO>
            <ns0:P_TRAMA_SALIDA>{ data($mensajeAuditoria/TRAMA_OUT) }</ns0:P_TRAMA_SALIDA>
            <ns0:P_MONTO_BONOS>{ $montoBonos }</ns0:P_MONTO_BONOS>
        </ns0:InputParameters>
};

declare function xf:normalizarNumero($valor as xs:string)
    as xs:string {
    	if (xs:string(number($valor)) = 'NaN') then
    		"0"
    	else
    		$valor
};

declare variable $uuid as xs:string external;
declare variable $mensajeAuditoria as element(ns1:Input_Parameters) external;

xf:consumirAuditoria_Req_insertarAuditoriaRecarga($uuid,
    $mensajeAuditoria)