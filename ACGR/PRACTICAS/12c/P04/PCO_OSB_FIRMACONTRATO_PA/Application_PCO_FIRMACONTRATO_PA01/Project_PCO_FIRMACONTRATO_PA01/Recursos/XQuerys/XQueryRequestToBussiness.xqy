xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.firmaEmpl.org";
(:: import schema at "../XMLFirmas/FirmaEmpleados.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_JCA_ConsultarEmpleados";
(:: import schema at "../../Resources/BS_JCA_ConsultarEmpleados_sp.xsd" ::)

declare variable $parametroEntradaEmpleado as element() (:: schema-element(ns1:empleadoRequest) ::) external;

declare function local:funcionTransformadora($parametroEntradaEmpleado as element() (:: schema-element(ns1:empleadoRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) 
{
    <ns2:InputParameters>
        <ns2:P_ID_EMPLEADO_INICIAL>{fn:data($parametroEntradaEmpleado/ns1:codigoEmpleadoInicial)}</ns2:P_ID_EMPLEADO_INICIAL>
        <ns2:P_ID_EMPLEADO_FINAL>{fn:data($parametroEntradaEmpleado/ns1:codigoEmpleadoFinal)}</ns2:P_ID_EMPLEADO_FINAL>
    </ns2:InputParameters>
};

local:funcionTransformadora($parametroEntradaEmpleado)
