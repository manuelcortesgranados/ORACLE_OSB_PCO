(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Error/";

declare function xf:consultarReglasProvision_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ $mensaje }</MENSAJE>
            <DESCRIPCION>{ concat($descripcion , fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasProvision_Error($codigo,
    $mensaje,
    $descripcion,
    $tiempoI)