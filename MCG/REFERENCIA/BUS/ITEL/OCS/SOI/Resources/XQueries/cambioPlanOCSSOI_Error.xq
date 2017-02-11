(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CAMBIAR_PLAN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CambiarPlanOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/cambiarPlanOCSSOI_Error/";

declare function xf:cambiarPlanOCSSOI_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CAMBIO_PLAN exito="false" mensaje = "{ $mensaje }" />
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:cambiarPlanOCSSOI_Error($codigo,
    $mensaje,
    $descripcion)