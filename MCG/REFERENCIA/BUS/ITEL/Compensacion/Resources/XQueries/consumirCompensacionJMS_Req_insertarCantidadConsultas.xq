xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$servicio" type="ns1:Input_Parameters/SERVICIOS_EJECUTADOS/SERVICIO" location="../Schemas/PS_ITEL_COMPENSACION.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Core/Resources/Schemas/PS_ITEL_INSERTARCANTIDADCONSULTASDIA.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Compensacion/Resources/XQueries/consumirCompensacionJMS_Req_insertarCantidadConsultas/";
declare namespace ns1 = "http://www.comcel.com.co/CompensacionITEL/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarCantidadConsultasDia/";

declare function xf:consumirCompensacionJMS_Req_insertarCantidadConsultas($servicio as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='MIN']/VALOR) }</MIN>
            <CONSULTASREALIZADAS>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CONSULTAS_REALIZADAS']/VALOR) }</CONSULTASREALIZADAS>
            <CONSULTASGRATIS>{ data($servicio/PARAMETROS/PARAMETRO[NOMBRE='CONSULTAS_GRATIS']/VALOR) }</CONSULTASGRATIS>
        </ns0:Input_Parameters>
};

declare variable $servicio as element() external;

xf:consumirCompensacionJMS_Req_insertarCantidadConsultas($servicio)