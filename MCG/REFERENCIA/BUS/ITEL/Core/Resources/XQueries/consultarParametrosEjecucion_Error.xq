(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPARAMETROSEJECUCION.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarParametrosEjecucion/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarParametrosEjecucion_Error/";

declare function xf:consultarParametrosEjecucion_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <PARAMETRO>{ $mensaje }</PARAMETRO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarParametrosEjecucion_Error($codigo,
    $mensaje,
    $descripcion)