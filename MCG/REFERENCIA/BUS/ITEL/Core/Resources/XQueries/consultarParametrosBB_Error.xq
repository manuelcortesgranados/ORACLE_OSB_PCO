(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_PARAMETROS_BB.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarParametrosBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarParametrosBB_Error/";

declare function xf:consultarParametrosBB_Error($codigo as xs:string,
    $descripcion as xs:string,
    $mensaje as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <VIGENCIA/>
                <CODIGO_ACTIVACION_RIM/>
                <CODIGO_DESACTIVACION_RIM/>
                <RESULTADO/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $mensaje as xs:string external;

xf:consultarParametrosBB_Error($codigo,
    $descripcion,
    $mensaje)
