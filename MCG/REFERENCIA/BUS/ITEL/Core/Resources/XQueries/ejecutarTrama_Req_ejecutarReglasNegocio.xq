(:: pragma bea:global-element-parameter parameter="$validarResponse" element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_ejecutarReglasNegocio/";

declare function xf:swapOrigenDestino($data as element(ns0:WS_Result))
as element(ns1:Input_Parameters)
{
let $metodo := data($data/MENSAJE/TRAMA/ns2:METODO)
let $Origen := data($data/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:MINORIGEN)
let $Destino := data($data/MENSAJE/TRAMA/ns2:MIN)
let $inOrigen := data($data/MENSAJE/IN_ORIGEN)
let $inDestino := data($data/MENSAJE/IN_DESTINO)
return 
   if ($metodo = '600' and (number($inOrigen) < 50 and number($inDestino) < 50)) then
      <ns1:Input_Parameters>
        <MIN_ORIGEN>{ $Destino }</MIN_ORIGEN>
        <MIN_DESTINO>{ $Origen } </MIN_DESTINO>
        <IN_ORIGEN>{$inDestino}</IN_ORIGEN>
        <IN_DESTINO>{$inOrigen}</IN_DESTINO>
      </ns1:Input_Parameters>
   else
      <ns1:Input_Parameters>
        <MIN_ORIGEN>{ $Origen }</MIN_ORIGEN>
        <MIN_DESTINO>{ $Destino } </MIN_DESTINO>
        <IN_ORIGEN>{$inOrigen}</IN_ORIGEN>
        <IN_DESTINO>{$inDestino}</IN_DESTINO>
      </ns1:Input_Parameters>
};
declare function xf:ejecutarTrama_Req_ejecutarReglasNegocio($validarResponse as element(ns0:WS_Result),
    $prefijo as xs:string,
    $tiempoInicio as xs:dateTime)
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <METODO>{ data($validarResponse/MENSAJE/TRAMA/ns2:METODO) }</METODO>
            <MIN_DESTINO>{ data(xf:swapOrigenDestino($validarResponse)/*:MIN_DESTINO) }</MIN_DESTINO>
            <MIN_ORIGEN>{ data(xf:swapOrigenDestino($validarResponse)/*:MIN_ORIGEN) }</MIN_ORIGEN>
            <IN_DESTINO>{ data(xf:swapOrigenDestino($validarResponse)/*:IN_DESTINO) }</IN_DESTINO>
            <IN_ORIGEN>{ data(xf:swapOrigenDestino($validarResponse)/*:IN_ORIGEN) }</IN_ORIGEN>
            <PREFIJO>{ $prefijo }</PREFIJO>
            <CONSECUTIVO>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:CONSECUTIVO) }</CONSECUTIVO>
            <CONTRATO>{ data($validarResponse/MENSAJE/CONTRATO) }</CONTRATO>
            <CONTRATOESPOSTPAGO>{ data($validarResponse/MENSAJE/CONTRATOESPOSTPAGO) }</CONTRATOESPOSTPAGO>
            <CATEGORIA>{ data($validarResponse/MENSAJE/CATEGORIA) }</CATEGORIA>
            <CARGAINICIAL>{ data($validarResponse/MENSAJE/CARGAINICIAL) }</CARGAINICIAL>
            <BLOQUEA>{ data($validarResponse/MENSAJE/BLOQUEA) }</BLOQUEA>
            <VIGENCIA>{ if(data($validarResponse/MENSAJE/TRAMA/ns2:METODO) = ("301","307","309","701")) then data($validarResponse/MENSAJE/VIGENCIA_DEFECTO) else data($validarResponse/MENSAJE/VIGENCIA) }</VIGENCIA>
            <PARAMETROS_TRAMA>
                <PARAMETRO>
                    <NOMBRE>MINORIGEN</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:MINORIGEN) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>COMENTARIO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:COMENTARIO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>HOSTID</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:HOSTID) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>CONSECUTIVO</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:CONSECUTIVO) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>MONTORECARGA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:MONTORECARGA) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>BONIFICAR</NOMBRE>
                    <TIPO>string</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:BONIFICAR) }</VALOR>
                </PARAMETRO>
                <PARAMETRO>
                    <NOMBRE>DIASVIGENCIA</NOMBRE>
                    <TIPO>decimal</TIPO>
                    <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:DIASVIGENCIA) }</VALOR>
                </PARAMETRO>
                {
	                if(data($validarResponse/MENSAJE/TRAMA/ns2:METODO) = ('200','201','212','400','401','402','403','407','408') ) then (
		        <PARAMETRO>
		            <NOMBRE>CUENTASDA</NOMBRE>
		            <TIPO>string</TIPO>
		            <VALOR>{ data($validarResponse/MENSAJE/TRAMA/ns2:PARAMETROS/ns2:CUENTASDA) }</VALOR>
		        </PARAMETRO>
                  )else()
                }
                {
	            if(data($validarResponse/MENSAJE/TRAMA/ns2:METODO) = ('306','310','311','313','314') ) then (
			        <PARAMETRO>
			            <NOMBRE>CAMBIOS_GRATIS</NOMBRE>
			            <TIPO>decimal</TIPO>
			            <VALOR>{ data($validarResponse/*:MENSAJE/*:CAMBIOS_GRATIS)}</VALOR>
			        </PARAMETRO>
                  )else()
                }
            </PARAMETROS_TRAMA>
            <TIEMPO_INICIO>{ $tiempoInicio }</TIEMPO_INICIO>
            <TIMEOUT>{ data($validarResponse/MENSAJE/TIMEOUT_CONSULTA) }</TIMEOUT>
        </ns1:Input_Parameters>
};

declare variable $validarResponse as element(ns0:WS_Result) external;
declare variable $prefijo as xs:string external;
declare variable $tiempoInicio as xs:dateTime external;

xf:ejecutarTrama_Req_ejecutarReglasNegocio($validarResponse,
    $prefijo,
    $tiempoInicio)