xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.osita.org";
(:: import schema at "../Schema/miPrimeraFirma.xsd" ::)

declare variable $miParametroEntrada as element() (:: schema-element(ns1:ositaRequest) ::) external;

declare function local:miFuncionTransformadora($miParametroEntrada as element() (:: schema-element(ns1:ositaRequest) ::)) as element() (:: schema-element(ns1:ositaResponse) ::) {
    <ns1:ositaResponse>
        <ns1:ositaVariableCadenaSalida>{fn:data($miParametroEntrada/ns1:ositaVariableCadenaEntrada)}</ns1:ositaVariableCadenaSalida>
    </ns1:ositaResponse>
};

local:miFuncionTransformadora($miParametroEntrada)
