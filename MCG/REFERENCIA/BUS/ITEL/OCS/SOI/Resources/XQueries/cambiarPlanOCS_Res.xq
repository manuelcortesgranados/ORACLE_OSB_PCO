(:: pragma bea:global-element-parameter parameter="$cambiarPlanResponse1" element="ns0:CambiarPlanResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CAMBIAR_PLAN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CambiarPlanOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/cambiarPlanOCS_Res/";

declare function xf:cambiarPlanOCS_Res($cambiarPlanResponse1 as element(ns0:CambiarPlanResponse), $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CAMBIAR_PLAN exito = "{ data($cambiarPlanResponse1/@exito) }"
                              mensaje = "{ data($cambiarPlanResponse1/@mensaje) }"/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $cambiarPlanResponse1 as element(ns0:CambiarPlanResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:cambiarPlanOCS_Res($cambiarPlanResponse1,
    $codigo,
    $descripcion)