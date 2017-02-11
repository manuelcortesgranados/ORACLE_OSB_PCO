(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARDATOSMINES.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarDatosMines/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_consultarDatosMines/";

declare function xf:ejecutarReglasNegocio_Req_consultarDatosMines($inOrigen as xs:string,
    $inDestino as xs:string,
    $minDestino as xs:string,
    $minOrigen as xs:string,
    $prefijo as xs:string,
    $timeout as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PREFIX>{ $prefijo }</PREFIX>
            <MINORIGEN>{ $minOrigen }</MINORIGEN>
            <MINDESTINO>{ $minDestino }</MINDESTINO>
            <INORIGEN>{ $inOrigen }</INORIGEN>
            <INDESTINO>{ $inDestino }</INDESTINO>
            <TIMEOUTMS>{ $timeout }</TIMEOUTMS>
        </ns0:Input_Parameters>
};

declare variable $inOrigen as xs:string external;
declare variable $inDestino as xs:string external;
declare variable $minDestino as xs:string external;
declare variable $minOrigen as xs:string external;
declare variable $prefijo as xs:string external;
declare variable $timeout as xs:decimal external;

xf:ejecutarReglasNegocio_Req_consultarDatosMines($inOrigen,
    $inDestino,
    $minDestino,
    $minOrigen,
    $prefijo,
    $timeout)