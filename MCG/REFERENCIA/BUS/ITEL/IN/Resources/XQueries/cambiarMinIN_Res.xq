(:: pragma bea:global-element-parameter parameter="$cambiarMinResponse" element="ns1:CambiarMinResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CAMBIAR_MIN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CambiarMinIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/cambiarMinIN_Res/";

declare function xf:cambiarMinIN_Res($cambiarMinResponse as element(ns1:CambiarMinResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{$codigo}</CODIGO>
            <MENSAJE>{ data($cambiarMinResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $cambiarMinResponse as element(ns1:CambiarMinResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:cambiarMinIN_Res($cambiarMinResponse,
	$codigo,
    $descripcion)