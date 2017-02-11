xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.bebe02.org";
(:: import schema at "../XMLSchema/Firma02.xsd" ::)

declare variable $parametroEntrada02 as element() (:: schema-element(ns1:ositaRequest) ::) external;

declare function local:funcionTransformadora02($parametroEntrada02 as element() (:: schema-element(ns1:ositaRequest) ::)) as element() (:: schema-element(ns1:ositaResponse) ::) {
    <ns1:ositaResponse>
        <ns1:ositaVariableCadenaSalida>{fn:data($parametroEntrada02/ns1:ositaVariableCadenaEntrada)}</ns1:ositaVariableCadenaSalida>
    </ns1:ositaResponse>
};

local:funcionTransformadora02($parametroEntrada02)
