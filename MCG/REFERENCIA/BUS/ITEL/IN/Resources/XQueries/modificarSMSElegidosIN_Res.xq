(:: pragma bea:global-element-parameter parameter="$modificarSMSElegidosResponse" element="ns0:ModificarSMSElegidosResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_MODIFICAR_SMSELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ModificarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/modificarSMSElegidosIN_Res/";

declare function xf:modificarSMSElegidosIN_Res($modificarSMSElegidosResponse as element(ns0:ModificarSMSElegidosResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($modificarSMSElegidosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $modificarSMSElegidosResponse as element(ns0:ModificarSMSElegidosResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:modificarSMSElegidosIN_Res($modificarSMSElegidosResponse,
    $codigo,
    $descripcion)