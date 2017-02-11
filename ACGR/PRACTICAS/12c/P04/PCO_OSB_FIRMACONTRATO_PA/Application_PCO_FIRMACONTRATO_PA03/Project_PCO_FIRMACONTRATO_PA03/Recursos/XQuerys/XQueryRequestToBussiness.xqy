xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.firLoc.org";
(:: import schema at "../XMLFirmas/FirmaLocaciones.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceLocaciones";
(:: import schema at "../../Resources/BSReferenceLocaciones_sp.xsd" ::)

declare variable $parametroEntradaLocaciones as element() (:: schema-element(ns1:locacionesRequest) ::) external;

declare function local:funcionTransformadora1($parametroEntradaLocaciones as element() (:: schema-element(ns1:locacionesRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_ID_LOCACION_INICIAL>{fn:data($parametroEntradaLocaciones/ns1:idLocacioInicial)}</ns2:P_ID_LOCACION_INICIAL>
        <ns2:P_ID_LOCACION_FINAL>{fn:data($parametroEntradaLocaciones/ns1:idLocacionFinal)}</ns2:P_ID_LOCACION_FINAL>
    </ns2:InputParameters>
};

local:funcionTransformadora1($parametroEntradaLocaciones)
