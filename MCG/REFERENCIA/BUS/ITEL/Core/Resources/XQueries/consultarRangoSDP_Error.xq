(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRANGOSDP.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoSDP/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarRangoSDP_Error/";

declare function xf:consultarRangoSDP_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <RSCODIGOSDP/>
                <RSCMININICAL/>
                <RSCMINFINAL/>
                <RSCESTADO/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarRangoSDP_Error($codigo,
    $mensaje,
    $descripcion)