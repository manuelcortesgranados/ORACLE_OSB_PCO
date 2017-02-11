(:: pragma bea:global-element-parameter parameter="$validarResponse" element="ns1:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$reglasNegocioResponse" element="ns3:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$ejecutadorResponse" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)
(:: pragma bea:global-element-return element="ns5:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns1 = "http://www.comcel.com.co/ValidarTrama/";
declare namespace ns4 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns3 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns5 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_Auditoria/";

declare function xf:ejecutarTrama_Req_Auditoria($codigoError as xs:string,
    $fechaEntrada as xs:dateTime,
    $fechaSalida as xs:dateTime,
    $tramaSalida as xs:string,
    $ip as xs:string,
    $host as xs:string,
    $duracionFinal as xs:integer,
    $validarResponse as element(ns1:WS_Result),
    $reglasNegocioResponse as element(ns3:WS_Result),
    $ejecutadorResponse as element(ns0:WS_Result))
    as element(ns5:Input_Parameters) {
        <ns5:Input_Parameters>
            <USUARIO>{ data($validarResponse/MENSAJE/TRAMA/ns4:USUARIO) }</USUARIO>
            <METODO>{ data($validarResponse/MENSAJE/TRAMA/ns4:METODO) }</METODO>
            <MIN_DESTINO>{ data($validarResponse/MENSAJE/TRAMA/ns4:MIN) }</MIN_DESTINO>
            <IN_DESTINO>{ data($validarResponse/MENSAJE/IN_DESTINO) }</IN_DESTINO>
            <IN_ORIGEN>{ data($validarResponse/MENSAJE/IN_ORIGEN) }</IN_ORIGEN>
            <TRAMA_IN>{ data($validarResponse/MENSAJE/TRAMA/ns4:TRAMA) }</TRAMA_IN>
            <FECHA_IN>{ $fechaEntrada }</FECHA_IN>
            <TRAMA_OUT>{ $tramaSalida }</TRAMA_OUT>
            <FECHA_OUT>{ $fechaSalida }</FECHA_OUT>
            <COD_RESPUESTA>{ $codigoError }</COD_RESPUESTA>
            <PARAMETROS_TRAMA>
                <PARAMETRO>
                    <NOMBRE>MINORIGEN</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:MINORIGEN) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>COMENTARIO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:COMENTARIO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>HOSTID</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:HOSTID) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>CONSECUTIVO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:CONSECUTIVO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>MONTORECARGA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:MONTORECARGA) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>BONIFICAR</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:BONIFICAR) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>DIASVIGENCIA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns4:PARAMETROS/ns4:DIASVIGENCIA) }</VALOR>
                </PARAMETRO>
                
                {
	                if ((data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = "100") or (data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = "101")) then
	                	<PARAMETRO>
	                    <NOMBRE>CONTRATO</NOMBRE>
	                    <TIPO>string</TIPO>
	                    <VALOR>{ data($validarResponse/MENSAJE/CONTRATO) }</VALOR>
	                	</PARAMETRO>
	                else
	                	()	
                }
                {
	                if(number(data($validarResponse/MENSAJE/IN_DESTINO)) >= 50 and data($validarResponse/MENSAJE/TRAMA/ns4:METODO) = ("400","401","402","403") ) then
	                	(<PARAMETRO>
		                    <NOMBRE>BALANCES</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ $ejecutadorResponse/MENSAJE/BALANCES/node() }</VALOR>
	                	</PARAMETRO>,
	                	<PARAMETRO>
		                    <NOMBRE>BONO_OCS</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/CARGAINICIAL) }</VALOR>
	                	</PARAMETRO>,
	                	<PARAMETRO>
		                    <NOMBRE>VIGENCIA_OCS</NOMBRE>
		                    <TIPO>string</TIPO>
		                    <VALOR>{ data($validarResponse/MENSAJE/VIGENCIA) }</VALOR>
	                	</PARAMETRO>)
	                else
	                	()	
                }
            </PARAMETROS_TRAMA>
            <PARAMETROS_NEGOCIO>
                {
                    for $PARAMETRO in $reglasNegocioResponse/MENSAJE/PARAMETROS_REGLAS/PARAMETRO
                    return
                        <PARAMETRO>{ $PARAMETRO/@* , $PARAMETRO/node() }</PARAMETRO>
                }
            </PARAMETROS_NEGOCIO>
            <IP>{ $ip }</IP>
            <HOST>{ $host }</HOST>
            <DURACION_1>{ if(data($validarResponse/MENSAJE/DURACION_GENERAL)!="") then data($validarResponse/MENSAJE/DURACION_GENERAL) else 0 }</DURACION_1>
            <DURACION_2>{ if(data($validarResponse/MENSAJE/DURACION_ESPECIFICA)!="") then data($validarResponse/MENSAJE/DURACION_ESPECIFICA) else 0 }</DURACION_2>
            <DURACION_3>{ if(data($reglasNegocioResponse/MENSAJE/DURREGLASNEGOCIO)!="") then data($reglasNegocioResponse/MENSAJE/DURREGLASNEGOCIO) else 0 }</DURACION_3>
            <DURACION_4>{ if(data($reglasNegocioResponse/MENSAJE/DURSUSCRIPTOR)!="") then data($reglasNegocioResponse/MENSAJE/DURSUSCRIPTOR) else 0 }</DURACION_4>
            <DURACION_5>{ if(data($ejecutadorResponse/MENSAJE/DURREGLASPROVISION)!="") then data($ejecutadorResponse/MENSAJE/DURREGLASPROVISION) else 0 }</DURACION_5>
            <DURACION_6>{ if(data($ejecutadorResponse/MENSAJE/DURSERVICIOSIN2)!="") then data($ejecutadorResponse/MENSAJE/DURSERVICIOSIN2) else 0 }</DURACION_6>
            <DURACION_7>{ if(string($duracionFinal)!="") then $duracionFinal else 0 }</DURACION_7>
            <DURACION_SUSCRIPTOR>{ if(data($reglasNegocioResponse/MENSAJE/DURSUSCRIPTOR)!="") then data($reglasNegocioResponse/MENSAJE/DURSUSCRIPTOR) else 0 }</DURACION_SUSCRIPTOR>
            <DURACION_TRANSACCION>{ if(data($ejecutadorResponse/MENSAJE/DURTXIN)!="") then data($ejecutadorResponse/MENSAJE/DURTXIN) else 0 }</DURACION_TRANSACCION>
        </ns5:Input_Parameters>
};

declare variable $codigoError as xs:string external;
declare variable $fechaEntrada as xs:dateTime external;
declare variable $fechaSalida as xs:dateTime external;
declare variable $tramaSalida as xs:string external;
declare variable $ip as xs:string external;
declare variable $host as xs:string external;
declare variable $duracionFinal as xs:integer external;
declare variable $validarResponse as element(ns1:WS_Result) external;
declare variable $reglasNegocioResponse as element(ns3:WS_Result) external;
declare variable $ejecutadorResponse as element(ns0:WS_Result) external;

xf:ejecutarTrama_Req_Auditoria($codigoError,
    $fechaEntrada,
    $fechaSalida,
    $tramaSalida,
    $ip,
    $host,
    $duracionFinal,
    $validarResponse,
    $reglasNegocioResponse,
    $ejecutadorResponse)