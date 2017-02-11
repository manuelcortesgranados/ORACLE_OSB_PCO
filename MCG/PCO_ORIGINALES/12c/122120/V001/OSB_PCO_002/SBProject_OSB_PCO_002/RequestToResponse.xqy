xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.miempresa.org";
(:: import schema at "xsd/miFirmaOperandosSumaResta.xsd" ::)

declare variable $solicitud as element() (:: schema-element(ns1:sumaRequest) ::) external;

declare function local:sumarDosNumerosMapeo($solicitud as element() (:: schema-element(ns1:sumaRequest) ::)) as element() (:: schema-element(ns1:sumaResponse) ::) {
    <ns1:sumaResponse>
        <ns1:respuesta>{fn:data($solicitud/ns1:operando1+$solicitud/ns1:operando2)}</ns1:respuesta>
    </ns1:sumaResponse>
};

local:sumarDosNumerosMapeo($solicitud)
