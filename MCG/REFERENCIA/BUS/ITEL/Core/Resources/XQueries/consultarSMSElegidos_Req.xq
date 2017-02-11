(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_CONSULTAR_SMSELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarSMSElegidosIN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarSMSElegidos_Req/";

declare function xf:consultarSMSElegidos_Req($prefijo as xs:string,
    $min as xs:string,
    $usuario as xs:string,
    $requestorId as xs:string,
    $in as xs:string,
    $timeout as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PREFIJO>{ $prefijo }</PREFIJO>
            <MIN>{ $min }</MIN>
            <USUARIO>{ $usuario }</USUARIO>
            <REQUESTOR_ID>{ xs:long($requestorId) }</REQUESTOR_ID>
            <IN>{ $in }</IN>
            <TIMEOUT>{ xs:long($timeout) }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $prefijo as xs:string external;
declare variable $min as xs:string external;
declare variable $usuario as xs:string external;
declare variable $requestorId as xs:string external;
declare variable $in as xs:string external;
declare variable $timeout as xs:string external;

xf:consultarSMSElegidos_Req($prefijo,
    $min,
    $usuario,
    $requestorId,
    $in,
    $timeout)