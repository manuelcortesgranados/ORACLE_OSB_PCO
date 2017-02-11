(:: pragma bea:global-element-parameter parameter="$eliminarSuscriptorResponse" element="ns1:EliminarSuscriptorResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ELIMINAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/EliminarSuscriptorIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/eliminarSuscriptorIN_Res/";

declare function xf:eliminarSuscriptorIN_Res($eliminarSuscriptorResponse as element(ns1:EliminarSuscriptorResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($eliminarSuscriptorResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $eliminarSuscriptorResponse as element(ns1:EliminarSuscriptorResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarSuscriptorIN_Res($eliminarSuscriptorResponse,
    $codigo,
    $descripcion)