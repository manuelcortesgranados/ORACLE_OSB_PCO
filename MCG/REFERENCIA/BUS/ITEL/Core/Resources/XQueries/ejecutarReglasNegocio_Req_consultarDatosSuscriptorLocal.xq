(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscriptorIN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_consultarDatosSuscriptorLocal/";

declare function xf:ejecutarReglasNegocio_Req_consultarDatosSuscriptorLocal($in as xs:string,
    $min as xs:string,
    $prefijo as xs:string,
    $timeout as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PREFIX>{ $prefijo }</PREFIX>
            <MIN>{ $min }</MIN>
            <IN>{ $in }</IN>
            <TIMEOUT>{ $timeout }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $in as xs:string external;
declare variable $min as xs:string external;
declare variable $prefijo as xs:string external;
declare variable $timeout as xs:decimal external;

xf:ejecutarReglasNegocio_Req_consultarDatosSuscriptorLocal($in,
    $min,
    $prefijo,
    $timeout)