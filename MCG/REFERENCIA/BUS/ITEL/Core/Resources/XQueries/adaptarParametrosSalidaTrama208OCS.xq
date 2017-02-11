xquery version "1.0" encoding "Cp1252";

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama208OCS/";

declare function xf:adaptarParametrosSalidaTrama208OCS($cantidadCambiosPlan as xs:string,
    $cantidadCambiosGratis as xs:string)
    as xs:string {
        xs:string
        (if(number($cantidadCambiosPlan) >= number($cantidadCambiosGratis)) then '1' else '0')
};

declare variable $cantidadCambiosPlan as xs:string external;
declare variable $cantidadCambiosGratis as xs:string external;

xf:adaptarParametrosSalidaTrama208OCS($cantidadCambiosPlan,
    $cantidadCambiosGratis)