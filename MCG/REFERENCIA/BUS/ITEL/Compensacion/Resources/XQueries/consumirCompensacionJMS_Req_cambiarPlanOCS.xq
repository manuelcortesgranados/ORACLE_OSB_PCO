(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$Servicio1" type="ns2:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../OCS/SOI/Resources/Schemas/PS_ITEL_CAMBIAR_PLAN.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns1 = "http://www.comcel.com.co/CambiarPlanOCS/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_cambiarPlanOCS/";

declare function xf:consumirCompensacionJMS_Req_cambiarPlanOCS($input_Parameters1 as element(ns2:Input_Parameters),
    $Servicio1 as element())
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <MIN>{ data($input_Parameters1/SUSCRIPTOR_OCS/*:MIN) }</MIN>
            <PLAN>{ if (fn:string-length(data($input_Parameters1/SUSCRIPTOR_OCS/*:SERVICE_CLASS)) = 4) then concat("R",data($input_Parameters1/SUSCRIPTOR_OCS/*:SERVICE_CLASS)) else concat("RP", data($input_Parameters1/SUSCRIPTOR_OCS/*:SERVICE_CLASS)) }</PLAN>
            <PLAN_ORIGINAL>{ if (fn:string-length(data($input_Parameters1/SUSCRIPTOR_OCS/*:SERVICE_CLASS)) = 4) then concat("R",data($input_Parameters1/SUSCRIPTOR_OCS/*:SERVICE_CLASS)) else concat("RP", data($input_Parameters1/SUSCRIPTOR_OCS/*:SERVICE_CLASS)) }</PLAN_ORIGINAL>
            <ACC_GRP_ID>{ data($input_Parameters1/SUSCRIPTOR_OCS/*:ACC_GRP_ID) }</ACC_GRP_ID>
            <IN>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="IN"]/VALOR)  }</IN>
            <TIMEOUT>{ data($Servicio1/PARAMETROS/PARAMETRO[NOMBRE="TIMEOUT"]/VALOR) }</TIMEOUT>          
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;
declare variable $Servicio1 as element() external;

xf:consumirCompensacionJMS_Req_cambiarPlanOCS($input_Parameters1,
    $Servicio1)