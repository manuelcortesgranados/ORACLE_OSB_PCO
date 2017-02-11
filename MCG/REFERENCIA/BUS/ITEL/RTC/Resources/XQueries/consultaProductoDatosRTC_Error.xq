(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_CONSULTAR_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/consultarPaqueteDatosRTC/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/consultarProductoDatosRTC_Error/";

declare function xf:consultarProductoDatosRTC_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ $mensaje } </MENSAJE>
            
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarProductoDatosRTC_Error($codigo,
    $mensaje,
    $descripcion)