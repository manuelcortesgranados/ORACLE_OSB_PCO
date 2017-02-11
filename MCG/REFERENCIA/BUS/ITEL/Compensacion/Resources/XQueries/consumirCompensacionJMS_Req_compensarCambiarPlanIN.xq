(:: pragma bea:local-element-parameter parameter="$servicio" type="ns2:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_COMPENSAR_CAMBIARPLAN.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns3 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CompensarCambiarPlanIN/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_compensarCambiarPlanIN/";

declare function xf:consumirCompensacionJMS_Req_compensarCambiarPlanIN($servicio as element(),
    $fechaExpiracion as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CARGA politicaExpiracion = "{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/POLITICA_EXPIRACION) }"
                   diasExtension = "{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/DIAS_EXTENSION) }"
                   fechaAbsoluta = "{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/FECHA_ABSOLUTA) }"
                   cuenta = "{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/CUENTA) }"
                   valor = "{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/VALOR) }"
                   usuario = "{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/USUARIO) }"
                   requestorId = "{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/REQUESTOR_ID) }">
                <ns3:tiquete>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/TIQUETE) }</ns3:tiquete>
                <ns3:tiqueteCompensacion>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CARGA']/VALOR/TIQUETE_COMPENSACION) }</ns3:tiqueteCompensacion>
            </CARGA>
            <PREFIJO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='PREFIX']/VALOR) }</PREFIJO>
            <MIN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <PLAN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='PLAN']/VALOR) }</PLAN>
            <PLAN_ORIGINAL>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='PLAN_ORIGINAL']/VALOR) }</PLAN_ORIGINAL>
            <IN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='IN']/VALOR) }</IN>
            <FECHA_EXPIRACION>{ $fechaExpiracion }</FECHA_EXPIRACION>
        </ns0:Input_Parameters>
};

declare variable $servicio as element() external;
declare variable $fechaExpiracion as xs:string external;

xf:consumirCompensacionJMS_Req_compensarCambiarPlanIN($servicio,
    $fechaExpiracion)