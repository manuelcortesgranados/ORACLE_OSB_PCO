(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_AUDITORIA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProv_Req_Auditoria/";

declare function xf:servicioProv_Req_Auditoria($tramaEntrada as xs:string,
    $inOrigen as xs:string,
    $inDestino as xs:string,
    $minDestino as xs:string,
    $metodo as xs:string,
    $usuario as xs:string,
    $codigoError as xs:string,
    $fechaEntrada as xs:dateTime,
    $fechaSalida as xs:dateTime,
    $tramaSalida as xs:string,
    $ip as xs:string,
    $host as xs:string,
    $duracionFinal as xs:int,
    $duracionSuscriptor as xs:int,
    $duracionTransaccion as xs:int)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <USUARIO>{ $usuario }</USUARIO>
            <METODO>{ $metodo }</METODO>
            <MIN_DESTINO>{ $minDestino }</MIN_DESTINO>
            <IN_DESTINO>{ $inDestino }</IN_DESTINO>
            <IN_ORIGEN>{ $inOrigen }</IN_ORIGEN>
            <TRAMA_IN>{ $tramaEntrada }</TRAMA_IN>
            <FECHA_IN>{ $fechaEntrada }</FECHA_IN>
            <TRAMA_OUT>{ $tramaSalida }</TRAMA_OUT>
            <FECHA_OUT>{ $fechaSalida }</FECHA_OUT>
            <COD_RESPUESTA>{ $codigoError }</COD_RESPUESTA>
            <PARAMETROS_TRAMA/>
            <PARAMETROS_NEGOCIO/>
            <IP>{ $ip }</IP>
            <HOST>{ $host }</HOST>
            <DURACION_1>0</DURACION_1>
            <DURACION_2>0</DURACION_2>
            <DURACION_3>0</DURACION_3>
            <DURACION_4>0</DURACION_4>
            <DURACION_5>0</DURACION_5>
            <DURACION_6>0</DURACION_6>
            <DURACION_7>
                {
                    if (string($duracionFinal) != "") then
                        ($duracionFinal)
                    else 
                        0
                }
           </DURACION_7>
           <DURACION_SUSCRIPTOR>{ $duracionSuscriptor }</DURACION_SUSCRIPTOR>
            <DURACION_TRANSACCION>{ $duracionTransaccion }</DURACION_TRANSACCION>
        </ns0:Input_Parameters>
};

declare variable $tramaEntrada as xs:string external;
declare variable $inOrigen as xs:string external;
declare variable $inDestino as xs:string external;
declare variable $minDestino as xs:string external;
declare variable $metodo as xs:string external;
declare variable $usuario as xs:string external;
declare variable $codigoError as xs:string external;
declare variable $fechaEntrada as xs:dateTime external;
declare variable $fechaSalida as xs:dateTime external;
declare variable $tramaSalida as xs:string external;
declare variable $ip as xs:string external;
declare variable $host as xs:string external;
declare variable $duracionFinal as xs:int external;
declare variable $duracionSuscriptor as xs:int external;
declare variable $duracionTransaccion as xs:int external;

xf:servicioProv_Req_Auditoria($tramaEntrada,
    $inOrigen,
    $inDestino,
    $minDestino,
    $metodo,
    $usuario,
    $codigoError,
    $fechaEntrada,
    $fechaSalida,
    $tramaSalida,
    $ip,
    $host,
    $duracionFinal,
    $duracionSuscriptor,
    $duracionTransaccion)