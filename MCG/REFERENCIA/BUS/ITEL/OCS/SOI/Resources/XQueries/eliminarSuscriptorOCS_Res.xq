(:: pragma bea:global-element-parameter parameter="$eliminarSuscriptorResponse1" element="ns1:EliminarSuscriptorResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ELIMINAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns0 = "http://www.comcel.com.co/EliminarSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/eliminarSuscriptorOCS_Res/";

declare function xf:eliminarSuscriptorOCS_Res($eliminarSuscriptorResponse1 as element(ns1:EliminarSuscriptorResponse), $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{$codigo}</CODIGO>
            <MENSAJE>
                <ELIMINAR_SUSCRIPTOR exito = "{ data($eliminarSuscriptorResponse1/@exito) }"
                                     mensaje = "{ data($eliminarSuscriptorResponse1/@mensaje) }"/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $eliminarSuscriptorResponse1 as element(ns1:EliminarSuscriptorResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarSuscriptorOCS_Res($eliminarSuscriptorResponse1,
    $codigo,
    $descripcion)