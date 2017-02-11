(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTARAUDITORIABLOQUEO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/InsertarAuditoriaBloqueo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_insertarAuditoriaBloqueo/";

declare function xf:ejecutador_Req_insertarAuditoriaBloqueo($min as xs:string,
    $trama as xs:string,
    $bloqueofraude as xs:string,
    $bloqueootro as xs:string,
    $transuuid as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<ns0:MIN>{ xs:decimal($min) }</ns0:MIN>
        	<ns0:TRAMA>{ $trama }</ns0:TRAMA>
            <ns0:BLOQUEOFRAUDE>{ if ( $bloqueofraude = "") then () else xs:decimal($bloqueofraude) }</ns0:BLOQUEOFRAUDE>
            <ns0:BLOQUEOOTRO>{ if ( $bloqueootro = "") then () else xs:decimal($bloqueootro) }</ns0:BLOQUEOOTRO>
            <ns0:TRANSUUID>{ if ( $transuuid = "") then () else xs:decimal($transuuid) }</ns0:TRANSUUID>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $trama as xs:string external;
declare variable $bloqueofraude as xs:string external;
declare variable $bloqueootro as xs:string external;
declare variable $transuuid as xs:string external;

xf:ejecutador_Req_insertarAuditoriaBloqueo($min,
    $trama,
    $bloqueofraude,
    $bloqueootro,
    $transuuid)