(:: pragma bea:global-element-parameter parameter="$validarResponse" element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARTRAMA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/DA_TRAMA";
declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarTramaSalida/";

declare function xf:adaptarTramaSalida($validarResponse as element(ns0:WS_Result),
    $codigo as xs:string,
    $descripcion as xs:string,
    $parametros as xs:string)
    as xs:string {
        concat($validarResponse/MENSAJE/TRAMA/ns1:USUARIO, "!", $validarResponse/MENSAJE/TRAMA/ns1:METODO, "!", $codigo, "!", $descripcion, "!", $parametros, "!*")
};

declare variable $validarResponse as element(ns0:WS_Result) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $parametros as xs:string external;

xf:adaptarTramaSalida($validarResponse,
    $codigo,
    $descripcion,
    $parametros)