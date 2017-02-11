(:: pragma bea:global-element-parameter parameter="$mensajeAuditoria" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:_etapaDOCollection" location="../Schemas/PS_ITEL_AUDITORIA_BAM.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaBAM/";
declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_enviarAuditoriaBAM/";

declare function xf:consumirAuditoria_Req_enviarAuditoriaBAM($uuid as xs:decimal,
    $mensajeAuditoria as element(ns0:Input_Parameters),
    $duracion as xs:decimal)
    as element(ns1:_etapaDOCollection) {
    	let $nodoMonto := $mensajeAuditoria/PARAMETROS_NEGOCIO/PARAMETRO[./NOMBRE='MONTOONPEAK']/VALOR
    	let $monto := if (empty($nodoMonto)) then "0" else xf:normalizarNumero(data($nodoMonto))
    	return
        <ns1:_etapaDOCollection>
            <_etapaDO>
                <_idTransaccion>{ $uuid }</_idTransaccion>
                <_proceso>{ data($mensajeAuditoria/METODO) }</_proceso>
                <_codRespuesta>{ data($mensajeAuditoria/COD_RESPUESTA) }</_codRespuesta>
                <_respuesta>{ data($mensajeAuditoria/TRAMA_OUT) }</_respuesta>
                <_tiempoTotal>{ $duracion }</_tiempoTotal>
                <_monto>{ $monto }</_monto>
                <_codigoINDestino>{ data($mensajeAuditoria/IN_DESTINO) }</_codigoINDestino>
                <_codigoINOrigen>{ data($mensajeAuditoria/IN_ORIGEN) }</_codigoINOrigen>
                <_tramaEntrada>{ data($mensajeAuditoria/TRAMA_IN) }</_tramaEntrada>
                <_duracion1>{ data($mensajeAuditoria/DURACION_1) }</_duracion1>
                <_duracion2>{ data($mensajeAuditoria/DURACION_2) }</_duracion2>
                <_duracion3>{ data($mensajeAuditoria/DURACION_3) }</_duracion3>
                <_duracion4>{ data($mensajeAuditoria/DURACION_4) }</_duracion4>
                <_duracion5>{ data($mensajeAuditoria/DURACION_5) }</_duracion5>
                <_duracion6>{ data($mensajeAuditoria/DURACION_6) }</_duracion6>
                <_duracion7>{ data($mensajeAuditoria/DURACION_7) }</_duracion7>
                <_durSuscriptor>{ data($mensajeAuditoria/DURACION_SUSCRIPTOR) }</_durSuscriptor>
                <_durTransaccion>{ data($mensajeAuditoria/DURACION_TRANSACCION) }</_durTransaccion>
                <_usuario>{ data($mensajeAuditoria/USUARIO) }</_usuario>
            </_etapaDO>
        </ns1:_etapaDOCollection>
};

declare function xf:normalizarNumero($valor as xs:string)
    as xs:string {
    	if (xs:string(number($valor)) = 'NaN') then
    		"0"
    	else
    		$valor
};

declare variable $uuid as xs:decimal external;
declare variable $mensajeAuditoria as element(ns0:Input_Parameters) external;
declare variable $duracion as xs:decimal external;

xf:consumirAuditoria_Req_enviarAuditoriaBAM($uuid,
    $mensajeAuditoria,
    $duracion)