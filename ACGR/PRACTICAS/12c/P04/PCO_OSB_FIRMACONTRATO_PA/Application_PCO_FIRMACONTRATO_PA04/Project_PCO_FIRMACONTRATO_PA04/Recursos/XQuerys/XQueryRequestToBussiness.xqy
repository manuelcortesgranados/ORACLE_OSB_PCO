xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.firdepart.org";
(:: import schema at "../XMLFirmas/FirmaDepartamentos.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceDepartamentos";
(:: import schema at "../../Resources/BSReferenceDepartamentos_sp.xsd" ::)

declare variable $parametroEntradaDepartamentos as element() (:: schema-element(ns1:departamentosRequest) ::) external;

declare function local:funcionTransformadora1($parametroEntradaDepartamentos as element() (:: schema-element(ns1:departamentosRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_ID_DEPARTAMENTOINICIAL>{fn:data($parametroEntradaDepartamentos/ns1:idDepartamentoInicial)}</ns2:P_ID_DEPARTAMENTOINICIAL>
        <ns2:P_ID_DEPARTAMENTOFINAL>{fn:data($parametroEntradaDepartamentos/ns1:idDepartamentoFinal)}</ns2:P_ID_DEPARTAMENTOFINAL>
    </ns2:InputParameters>
};

local:funcionTransformadora1($parametroEntradaDepartamentos)
