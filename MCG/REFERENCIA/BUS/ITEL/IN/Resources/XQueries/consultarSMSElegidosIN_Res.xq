(:: pragma bea:global-element-parameter parameter="$consultarSMSElegidosResponse" element="ns0:ConsultarSMSElegidosResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_SMSELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/consultarSMSElegidosIN_Res/";

declare function xf:consultarSMSElegidosIN_Res($consultarSMSElegidosResponse as element(ns0:ConsultarSMSElegidosResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ data($consultarSMSElegidosResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $consultarSMSElegidosResponse as element(ns0:ConsultarSMSElegidosResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarSMSElegidosIN_Res($consultarSMSElegidosResponse,
    $codigo,
    $descripcion)