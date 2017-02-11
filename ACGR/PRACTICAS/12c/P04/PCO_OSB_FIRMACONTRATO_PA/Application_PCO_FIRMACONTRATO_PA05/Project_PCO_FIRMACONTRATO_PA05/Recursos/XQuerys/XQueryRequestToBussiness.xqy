xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.firReg.org";
(:: import schema at "../XMLFirmas/FirmaRegiones.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceRegiones";
(:: import schema at "../../Resources/BSReferenceRegiones_sp.xsd" ::)

declare variable $parametroEntradaRegiones as element() (:: schema-element(ns1:regionesRequest) ::) external;

declare function local:funcionTransformadora($parametroEntradaRegiones as element() (:: schema-element(ns1:regionesRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_ID_REGION_INICIAL>{fn:data($parametroEntradaRegiones/ns1:idRegionInicial)}</ns2:P_ID_REGION_INICIAL>
        <ns2:P_ID_REGION_FINAL>{fn:data($parametroEntradaRegiones/ns1:idRegionFinal)}</ns2:P_ID_REGION_FINAL>
    </ns2:InputParameters>
};

local:funcionTransformadora($parametroEntradaRegiones)
