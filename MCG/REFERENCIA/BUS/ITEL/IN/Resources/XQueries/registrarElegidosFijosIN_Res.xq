(:: pragma bea:global-element-parameter parameter="$registrarElegidosFijosResponse" element="ns0:RegistrarFAResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_REGISTRAR_ELEGIDOSFIJOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/RegistrarElegidosFijosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/registrarElegidosFijosIN_Res/";

declare function xf:registrarElegidosFijosIN_Res($registrarElegidosFijosResponse as element(ns0:RegistrarFAResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($registrarElegidosFijosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $registrarElegidosFijosResponse as element(ns0:RegistrarFAResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:registrarElegidosFijosIN_Res($registrarElegidosFijosResponse,
    $codigo,
    $descripcion)