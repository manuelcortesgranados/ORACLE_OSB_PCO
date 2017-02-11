xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_FECHA_EXPIRACION.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/actualizarFechaExpiracionPaqueteOCS_Error/";
declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/ActualizarFechaExpiracionPaqueteOCS/";

declare function xf:actualizarFechaExpiracionPaqueteOCS_Error($codigo as xs:string,
    $descripcion as xs:string,
    $mensaje as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ACTUALIZAR_FECHA_EXPIRACION>
                    {
                       $mensaje
                    }
                </ACTUALIZAR_FECHA_EXPIRACION>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $mensaje as xs:string external;

xf:actualizarFechaExpiracionPaqueteOCS_Error($codigo,
    $descripcion,
    $mensaje)