xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.bebe06.org";
(:: import schema at "../XMLSchema/Firma06.xsd" ::)

declare variable $parametroEntrada as element() (:: schema-element(ns1:requestType) ::) external;

declare function local:funcionTransformadora($parametroEntrada as element() (:: schema-element(ns1:requestType) ::)) as element() (:: schema-element(ns1:responseType) ::) {
    <ns1:responseType>
        <ns1:variableCadenaSalida>{fn:data($parametroEntrada/ns1:variableCadenaEntrada)}</ns1:variableCadenaSalida>
    </ns1:responseType>
};

local:funcionTransformadora($parametroEntrada)
