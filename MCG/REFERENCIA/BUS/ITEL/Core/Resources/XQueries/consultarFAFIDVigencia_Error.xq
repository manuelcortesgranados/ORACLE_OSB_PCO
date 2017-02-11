xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARFAFIDVIGENCIA.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFAFIDVigencia_Error/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarFAFIDVigencia";

declare function xf:consultarFAFIDVigencia_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
as element(ns0:WS_Result) {
    <ns0:WS_Result>
        <CODIGO>{ $codigo }</CODIGO>
        <MENSAJE>
        </MENSAJE>
        <DESCRIPCION>{ $descripcion }</DESCRIPCION>
    </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarFAFIDVigencia_Error($codigo,
    $mensaje,
    $descripcion)