(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_MIN_OCS_DRP.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarMinOcsDrp/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarMinOcsDrp_Error/";

declare function xf:consultarMinOcsDrp_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarMinOcsDrp_Error($codigo,
    $mensaje,
    $descripcion)
