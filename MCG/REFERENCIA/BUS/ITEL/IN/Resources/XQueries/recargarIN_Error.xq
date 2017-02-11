(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_RECARGAR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/RecargarIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/recargarIN_Error/";

declare function xf:recargarIN_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Recarga exito="false" mensaje = "{ $mensaje }" />
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:recargarIN_Error($codigo,
    $mensaje,
    $descripcion)