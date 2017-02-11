(:: pragma bea:global-element-parameter parameter="$bloquearSuscriptorResponse" element="ns1:BloquearSuscriptorResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_BLOQUEAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/BloquearSuscriptorIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/bloquearSuscriptorIN_Res/";

declare function xf:bloquearSuscriptorIN_Res($bloquearSuscriptorResponse as element(ns1:BloquearSuscriptorResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{$codigo}</CODIGO>
            <MENSAJE>{ data($bloquearSuscriptorResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $bloquearSuscriptorResponse as element(ns1:BloquearSuscriptorResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:bloquearSuscriptorIN_Res($bloquearSuscriptorResponse,
	$codigo,
    $descripcion)