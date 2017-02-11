xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA_ESPECIFICA.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/pruebaborrar2/";
declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";

declare function xf:pruebaborrar2($codigo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters/>
};

declare variable $codigo as xs:string external;

xf:pruebaborrar2($codigo)
