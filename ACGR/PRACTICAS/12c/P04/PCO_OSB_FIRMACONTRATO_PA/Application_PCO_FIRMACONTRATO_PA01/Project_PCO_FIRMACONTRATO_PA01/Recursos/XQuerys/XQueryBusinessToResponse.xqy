xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.firmaEmpl.org";
(:: import schema at "../XMLFirmas/FirmaEmpleados.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/BS_JCA_ConsultarEmpleados";
(:: import schema at "../../Resources/BS_JCA_ConsultarEmpleados_sp.xsd" ::)

declare variable $variableSalida as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:funcionTransformadora($variableSalida as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:empleadoResponse) ::) 
{
    <ns2:empleadoResponse>
    {
      for $empleado in $variableSalida/ns1:P_CURSOR_RETORNO/ns1:Row
      return
        <ns2:Empleados>
            <ns2:idEmpleado>{data($empleado/ns1:Column[@name="EMPLOYEE_ID"])}</ns2:idEmpleado>
            <ns2:nombreEmpleado>{data($empleado/ns1:Column[@name="FIRST_NAME"])}</ns2:nombreEmpleado>
            <ns2:apellidoEmpleado>{data($empleado/ns1:Column[@name="LAST_NAME"])}</ns2:apellidoEmpleado>
            <ns2:emailEmpleado>{data($empleado/ns1:Column[@name="EMAIL"])}</ns2:emailEmpleado>
            <ns2:telefonoEmpleado>{data($empleado/ns1:Column[@name="PHONE_NUMBE"])}</ns2:telefonoEmpleado>
            <ns2:fechaContratacion>{data($empleado/ns1:Column[@name="HIRE_DATE"])}</ns2:fechaContratacion>
            <ns2:idEmpleo>{data($empleado/ns1:Column[@name="JOB_ID"])}</ns2:idEmpleo>
            <ns2:salarioEmpleado>{data($empleado/ns1:Column[@name="SALARY"])}</ns2:salarioEmpleado>
            <ns2:comisionEmpleado>{data($empleado/ns1:Column[@name="COMMISSION_PCT"])}</ns2:comisionEmpleado>
            <ns2:idJefe>{data($empleado/ns1:Column[@name="MANAGER_ID"])}</ns2:idJefe>
            <ns2:idDepartamento>{data($empleado/ns1:Column[@name="DEPARTMENT_ID"])}</ns2:idDepartamento>
        </ns2:Empleados>
    }
    </ns2:empleadoResponse>
};

local:funcionTransformadora($variableSalida)
