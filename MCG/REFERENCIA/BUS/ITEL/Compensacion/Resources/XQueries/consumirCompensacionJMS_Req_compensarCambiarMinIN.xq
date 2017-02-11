(:: pragma bea:local-element-parameter parameter="$suscriptorDestino" type="ns2:Input_Parameters/SUSCRIPTOR_DESTINO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:local-element-parameter parameter="$servicio" type="ns2:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../IN/Resources/Schemas/PS_ITEL_COMPENSAR_CAMBIARMIN.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns1 = "http://www.comcel.com.co/CompensarCambiarMinIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_compensarCambiarMinIN/";

declare function xf:consumirCompensacionJMS_Req_compensarCambiarMinIN($servicio as element())
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <SUSCRIPTOR>{ $servicio/PARAMETROS/PARAMETRO[NOMBRE='SUSCRIPTOR']/VALOR/@* , $servicio/PARAMETROS/PARAMETRO[NOMBRE='SUSCRIPTOR']/VALOR/node() }</SUSCRIPTOR>
            <PREFIJO>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='PREFIX']/VALOR) }</PREFIJO>
            <MIN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <HOST_ID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='USUARIO']/VALOR) }</HOST_ID>
            <REQUESTOR_ID>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='REQUESTOR_ID']/VALOR) }</REQUESTOR_ID>
            <IN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='IN']/VALOR) }</IN>
        </ns1:Input_Parameters>
};

declare variable $servicio as element() external;

xf:consumirCompensacionJMS_Req_compensarCambiarMinIN($servicio)