xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.firEmpleo.org";
(:: import schema at "../XMLFirmas/FirmaEmpleos.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceEmpleos";
(:: import schema at "../../Resources/BSReferenceEmpleos_sp.xsd" ::)

declare variable $parametroEntradaEmpleo as element() (:: schema-element(ns1:empleoRequest) ::) external;

declare function local:funcionTransformadora1($parametroEntradaEmpleo as element() (:: schema-element(ns1:empleoRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_ID_EMPLEADO_INICIAL>{fn:data($parametroEntradaEmpleo/ns1:codigoEmpleoInicial)}</ns2:P_ID_EMPLEADO_INICIAL>
        <ns2:P_ID_EMPLEADO_FINAL>{fn:data($parametroEntradaEmpleo/ns1:codigoEmpleoFinal)}</ns2:P_ID_EMPLEADO_FINAL>
    </ns2:InputParameters>
};

local:funcionTransformadora1($parametroEntradaEmpleo)
