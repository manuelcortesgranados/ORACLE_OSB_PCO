(:: pragma bea:global-element-parameter parameter="$eliminarSMSElegidosResponse" element="ns0:EliminarSMSElegidosResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_MODIFICAR_SMSELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EliminarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/eliminarSMSElegidosIN_Res/";

declare function xf:eliminarSMSElegidosIN_Res($eliminarSMSElegidosResponse as element(ns0:EliminarSMSElegidosResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($eliminarSMSElegidosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $eliminarSMSElegidosResponse as element(ns0:EliminarSMSElegidosResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarSMSElegidosIN_Res($eliminarSMSElegidosResponse,
    $codigo,
    $descripcion)