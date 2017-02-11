(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_ELIMINAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EliminarSuscriptorOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/eliminarSuscriptorOCSSOI_Error/";

declare function xf:eliminarSuscriptorOCSSOI_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ELIMINAR_SUSCRIPTOR exito="false" mensaje = "{ $mensaje }" />
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarSuscriptorOCSSOI_Error($codigo,
    $mensaje,
    $descripcion)