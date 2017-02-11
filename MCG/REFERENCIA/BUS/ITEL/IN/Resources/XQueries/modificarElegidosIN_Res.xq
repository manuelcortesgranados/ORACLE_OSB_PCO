(:: pragma bea:global-element-parameter parameter="$modificarElegidosResponse" element="ns1:ModificarElegidosResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_MODIFICAR_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/ModificarElegidosIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/modificarElegidosIN_Res/";

declare function xf:modificarElegidosIN_Res($modificarElegidosResponse as element(ns1:ModificarElegidosResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($modificarElegidosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $modificarElegidosResponse as element(ns1:ModificarElegidosResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:modificarElegidosIN_Res($modificarElegidosResponse,
    $codigo,
    $descripcion)