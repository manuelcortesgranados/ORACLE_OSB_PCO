(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Error/";

declare function xf:ejecutarReglasNegocio_Error($descripcion as xs:string,
    $codigo as xs:string,
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE></MENSAJE>
            <DESCRIPCION>{ concat($descripcion , fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $descripcion as xs:string external;
declare variable $codigo as xs:string external;
declare variable $tiempoI as xs:time external;

xf:ejecutarReglasNegocio_Error($descripcion,
    $codigo,
    $tiempoI)