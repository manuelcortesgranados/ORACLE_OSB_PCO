(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarRangoMin_Error/";

declare function xf:consultarRangoMin_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <RMCCODIGOIN/>
                <RMCMININICAL/>
                <RMCMINFINAL/>
                <RMCESTADO/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarRangoMin_Error($codigo,
    $mensaje,
    $descripcion)