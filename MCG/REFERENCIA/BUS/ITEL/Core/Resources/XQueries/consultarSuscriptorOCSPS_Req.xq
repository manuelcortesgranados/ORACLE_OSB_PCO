(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/SOI/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarSuscriptorOCSPS_Req/";

declare function xf:consultarSuscriptorOCSPS_Req($min as xs:string,
    $in as xs:string,
    $timeout as xs:long)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <IN>{ $in }</IN>
            <TIMEOUT>{ $timeout }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $in as xs:string external;
declare variable $timeout as xs:long external;

xf:consultarSuscriptorOCSPS_Req($min,
    $in,
    $timeout)