(:: pragma bea:global-element-parameter parameter="$cambiarPlanResponse" element="ns1:CambiarPlanResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CAMBIAR_PLAN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CambiarPlanIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/cambiarPlanIN_Res/";

declare function xf:cambiarPlanIN_Res($cambiarPlanResponse as element(ns1:CambiarPlanResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{$codigo}</CODIGO>
            <MENSAJE>{ data($cambiarPlanResponse/@mensaje) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $cambiarPlanResponse as element(ns1:CambiarPlanResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:cambiarPlanIN_Res($cambiarPlanResponse,
	$codigo,
    $descripcion)