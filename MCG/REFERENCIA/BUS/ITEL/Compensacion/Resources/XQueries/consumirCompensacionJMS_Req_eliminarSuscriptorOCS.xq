(:: pragma bea:local-element-parameter parameter="$input_Parameters1" type="ns2:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/SOI/Resources/Schemas/PS_ITEL_ELIMINAR_SUSCRIPTOR.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/EliminarSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_eliminarSuscriptorOCS/";

declare function xf:consumirCompensacionJMS_Req_eliminarSuscriptorOCS($input_Parameters1 as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE='SUSCRIPTOR']/VALOR/*:DirectoryNumber) }</MIN>
            <IN>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE='IN']/VALOR) }</IN>
            <TIMEOUT>{ data($input_Parameters1/PARAMETROS/PARAMETRO[NOMBRE='TIMEOUT']/VALOR) }</TIMEOUT>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element() external;

xf:consumirCompensacionJMS_Req_eliminarSuscriptorOCS($input_Parameters1)