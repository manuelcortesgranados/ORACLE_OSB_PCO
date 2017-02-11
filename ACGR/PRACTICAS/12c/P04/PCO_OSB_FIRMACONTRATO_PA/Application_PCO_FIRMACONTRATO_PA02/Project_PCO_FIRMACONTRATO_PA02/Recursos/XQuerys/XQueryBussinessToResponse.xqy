xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.firEmpleo.org";
(:: import schema at "../XMLFirmas/FirmaEmpleos.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceEmpleos";
(:: import schema at "../../Resources/BSReferenceEmpleos_sp.xsd" ::)

declare variable $parametroSalidaEmpleo as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:funcionTransformadora2($parametroSalidaEmpleo as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:empleoResponse) ::) 
{
    <ns2:empleoResponse>
    {
      for $empleo in $parametroSalidaEmpleo/ns1:P_CURSOR_RETORNO/ns1:Row
      return
        <ns2:Empleos>
            <ns2:idEmpleo>{data($empleo/ns1:Column[@name="JOB_ID"])}</ns2:idEmpleo>
            <ns2:tituloEmpleo>{data($empleo/ns1:Column[@name="JOB_TITLE"])}</ns2:tituloEmpleo>
            <ns2:salarioMinimo>{data($empleo/ns1:Column[@name="MIN_SALARY"])}</ns2:salarioMinimo>
            <ns2:salarioMaximo>{data($empleo/ns1:Column[@name="MAX_SALARY"])}</ns2:salarioMaximo>
       </ns2:Empleos>            
      }
    </ns2:empleoResponse>
};

local:funcionTransformadora2($parametroSalidaEmpleo)
