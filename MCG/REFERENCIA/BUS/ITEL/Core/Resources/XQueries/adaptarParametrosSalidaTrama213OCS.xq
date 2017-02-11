xquery version "1.0" encoding "Cp1252";

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama213OCS/";

declare function xf:adaptarParametrosSalidaTrama213OCS($cantidadCambiosFNF as xs:string,
    $cantidadCambiosGratis as xs:string)
    as xs:string {
        xs:string
        (if(number($cantidadCambiosFNF) >= number($cantidadCambiosGratis)) then '1' else '0')
};

declare variable $cantidadCambiosFNF as xs:string external;
declare variable $cantidadCambiosGratis as xs:string external;

xf:adaptarParametrosSalidaTrama213OCS($cantidadCambiosFNF,
    $cantidadCambiosGratis)