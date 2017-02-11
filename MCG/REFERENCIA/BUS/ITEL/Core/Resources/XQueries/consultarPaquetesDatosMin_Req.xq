(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_DATOS_MIN_PS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesDatosMin/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatosMin_Req/";

declare function xf:consultarPaquetesDatosMin_Req($string1 as xs:string,
    $string2 as xs:string,
    $string3 as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ concat(57,$string1) }</MIN>
            <ESTADO>{ $string2 }</ESTADO>
            <CANAL>{ $string3 }</CANAL>
        </ns0:Input_Parameters>
};

declare variable $string1 as xs:string external;
declare variable $string2 as xs:string external;
declare variable $string3 as xs:string external;

xf:consultarPaquetesDatosMin_Req($string1,
    $string2,
    $string3)
