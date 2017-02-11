xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.bebe09.org";
(:: import schema at "../XMLSchema/Firma09.xsd" ::)

declare variable $parametroEntrada as element() (:: schema-element(ns1:cadenaRequest) ::) external;

declare function local:funcionTransformadora($parametroEntrada as element() (:: schema-element(ns1:cadenaRequest) ::)) as element() (:: schema-element(ns1:cadenaResponse) ::) {
    <ns1:cadenaResponse>
        <ns1:variableCadenaSalida>{fn:data($parametroEntrada/ns1:variableCadenaEntrada)}</ns1:variableCadenaSalida>
    </ns1:cadenaResponse>
};

local:funcionTransformadora($parametroEntrada)
