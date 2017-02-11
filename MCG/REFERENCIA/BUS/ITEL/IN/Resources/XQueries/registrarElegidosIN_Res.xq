(:: pragma bea:global-element-parameter parameter="$registrarElegidosResponse" element="ns0:RegistrarElegidosResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_REGISTRAR_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/RegistrarElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/registrarElegidosIN_Res/";

declare function xf:registrarElegidosIN_Res($registrarElegidosResponse as element(ns0:RegistrarElegidosResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($registrarElegidosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $registrarElegidosResponse as element(ns0:RegistrarElegidosResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:registrarElegidosIN_Res($registrarElegidosResponse,
    $codigo,
    $descripcion)