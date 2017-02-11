(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_PROVISION_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/SuscriptionAddRequestSM/";
declare namespace xf = "http://tempuri.org/ITEL/SM/Resources/XQueries/provisionPaqueteDatosSM_Error/";

declare function xf:provisionPaqueteDatosSM_Error($codigo as xs:string,
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

xf:provisionPaqueteDatosSM_Error($codigo,
    $mensaje,
    $descripcion)