xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_BLOQUEO_HOTKIT.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_insertarBloqueoHotkit/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarBloqueoHotkit";

declare function xf:ejecutador_Req_insertarBloqueoHotkit($min as xs:string,
    $trama as xs:string,
    $numeroreporte as xs:string,
    $transuuid as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<ns0:MIN>{ xs:decimal($min) }</ns0:MIN>
        	<ns0:TRAMA>{ $trama }</ns0:TRAMA>
            <ns0:NUMEROREPORTE>{ if ( $numeroreporte = "") then () else xs:decimal($numeroreporte) }</ns0:NUMEROREPORTE>
            <ns0:TRANSUUID>{ if ( $transuuid = "") then () else xs:decimal($transuuid) }</ns0:TRANSUUID>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $trama as xs:string external;
declare variable $numeroreporte as xs:string external;
declare variable $transuuid as xs:string external;

xf:ejecutador_Req_insertarBloqueoHotkit($min,
    $trama,
    $numeroreporte,
    $transuuid)