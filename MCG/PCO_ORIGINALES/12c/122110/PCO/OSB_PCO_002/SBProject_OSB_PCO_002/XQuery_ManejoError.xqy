xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.miempresa.org";
(:: import schema at "xsd/miFirmaOperandosSumaResta.xsd" ::)

declare variable $request as element() (:: schema-element(ns1:sumaRequest) ::) external;

declare function local:func($request as element() (:: schema-element(ns1:sumaRequest) ::)) as element() (:: schema-element(ns1:sumaFalta) ::) {
    <ns1:sumaFalta>
        <ns1:descripcion>{fn:concat('Error grave al sumar ',fn:data($request/ns1:operando1),' y el numero ',fn:data($request/ns1:operando2))}</ns1:descripcion>
    </ns1:sumaFalta>
};

local:func($request)
