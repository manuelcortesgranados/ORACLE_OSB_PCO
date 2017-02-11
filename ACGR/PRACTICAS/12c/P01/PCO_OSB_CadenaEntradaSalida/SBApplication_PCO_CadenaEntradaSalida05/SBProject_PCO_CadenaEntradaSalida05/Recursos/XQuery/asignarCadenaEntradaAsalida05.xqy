xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.bebe05.org";
(:: import schema at "../XMLSchema/Firma05.xsd" ::)

declare variable $parametroEntrada as element() (:: schema-element(ns1:ositaRequest) ::) external;

declare function local:funcionTransformadora($parametroEntrada as element() (:: schema-element(ns1:ositaRequest) ::)) as element() (:: schema-element(ns1:ositaResponse) ::) {
    <ns1:ositaResponse>
        <ns1:variableCadenaSalida>{fn:data($parametroEntrada/ns1:variableCadenaEntrada)}</ns1:variableCadenaSalida>
    </ns1:ositaResponse>
};

local:funcionTransformadora($parametroEntrada)
