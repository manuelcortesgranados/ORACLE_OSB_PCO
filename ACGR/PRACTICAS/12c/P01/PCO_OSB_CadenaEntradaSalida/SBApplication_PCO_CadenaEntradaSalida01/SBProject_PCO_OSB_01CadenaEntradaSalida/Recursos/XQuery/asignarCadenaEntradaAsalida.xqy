xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.bebe.org";
(:: import schema at "../XMLSchema/Firma01.xsd" ::)

declare variable $parametroEntrada01 as element() (:: schema-element(ns1:ositaRequest) ::) external;

declare function local:funcionTransformadora($parametroEntrada01 as element() (:: schema-element(ns1:ositaRequest) ::)) as element() (:: schema-element(ns1:ositaResponse) ::) {
    <ns1:ositaResponse>
        <ns1:ositaVariableCadenaSalida>{fn:concat(fn:data($parametroEntrada01/ns1:ositaVariableCadenaEntrada),' UNIMOS SEGUNDA CADENA BEBE')}</ns1:ositaVariableCadenaSalida>
    </ns1:ositaResponse>
};

local:funcionTransformadora($parametroEntrada01)
