(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_ELIMINAR_SUSCRIPCION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EliminarSuscripcionOCS/";
declare namespace ns0 = "http://webapps.online.ericsson.com";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/eliminarSuscripcionOCSOLM_Error/";

declare function xf:eliminarSuscripcionOCSOLM_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ELIMINAR_SUSCRIPCION>
                  {
                       $mensaje
                    }
                </ELIMINAR_SUSCRIPCION>    
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarSuscripcionOCSOLM_Error($codigo,
    $mensaje,
    $descripcion)