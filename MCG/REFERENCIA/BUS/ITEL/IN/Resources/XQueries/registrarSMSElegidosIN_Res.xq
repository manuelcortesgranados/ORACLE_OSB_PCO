(:: pragma bea:global-element-parameter parameter="$registrarSMSElegidosResponse" element="ns0:RegistrarSMSElegidosResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_REGISTRAR_SMSELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/RegistrarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/registrarSMSElegidosIN_Res/";

declare function xf:registrarSMSElegidosIN_Res($registrarSMSElegidosResponse as element(ns0:RegistrarSMSElegidosResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($registrarSMSElegidosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $registrarSMSElegidosResponse as element(ns0:RegistrarSMSElegidosResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:registrarSMSElegidosIN_Res($registrarSMSElegidosResponse,
    $codigo,
    $descripcion)