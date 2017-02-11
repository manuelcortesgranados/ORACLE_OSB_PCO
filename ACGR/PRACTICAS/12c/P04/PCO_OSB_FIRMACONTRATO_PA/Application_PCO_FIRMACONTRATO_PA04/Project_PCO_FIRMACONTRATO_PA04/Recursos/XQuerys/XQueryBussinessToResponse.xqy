xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.firdepart.org";
(:: import schema at "../XMLFirmas/FirmaDepartamentos.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BSReferenceDepartamentos";
(:: import schema at "../../Resources/BSReferenceDepartamentos_sp.xsd" ::)

declare variable $parametroSalidaDepartamentos as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:funcionTransformadora2($parametroSalidaDepartamentos as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:departamentosResponse) ::) 
{
    <ns2:departamentosResponse>
    {
      for $departamentos in $parametroSalidaDepartamentos/ns1:P_CURSOR_RETORNO/ns1:Row
      return
        <ns2:departamentos>
            <ns2:departamentoId>{data($departamentos/ns1:Column[@name="DEPARTMENT_ID"])}</ns2:departamentoId>
            <ns2:nombreDepartamento>{data($departamentos/ns1:Column[@name="DEPARTMENT_NAME"])}</ns2:nombreDepartamento>
            <ns2:idJefeArea>{data($departamentos/ns1:Column[@name="MANAGER_ID"])}</ns2:idJefeArea>
            <ns2:idLocacion>{data($departamentos/ns1:Column[@name="LOCATION_ID"])}</ns2:idLocacion>
        </ns2:departamentos>
    }   
    </ns2:departamentosResponse>
};

local:funcionTransformadora2($parametroSalidaDepartamentos)
