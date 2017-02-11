(:: pragma bea:global-element-parameter parameter="$modificarElegidosFijosResponse" element="ns0:ModificarFAResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_MODIFICAR_ELEGIDOSFIJOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ModificarElegidosFijosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/modificarElegidosFijosIN_Res/";

declare function xf:modificarElegidosFijosIN_Res($modificarElegidosFijosResponse as element(ns0:ModificarFAResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($modificarElegidosFijosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $modificarElegidosFijosResponse as element(ns0:ModificarFAResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:modificarElegidosFijosIN_Res($modificarElegidosFijosResponse,
    $codigo,
    $descripcion)