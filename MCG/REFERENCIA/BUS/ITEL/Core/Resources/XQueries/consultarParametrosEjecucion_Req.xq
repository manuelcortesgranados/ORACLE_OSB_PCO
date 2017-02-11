xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPARAMETROSEJECUCION.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarParametrosEjecucion_Req/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarParametrosEjecucion/";

declare function xf:consultarParametrosEjecucion_Req()
as element(ns0:Input_Parameters) {
    <ns0:Input_Parameters/>
};


xf:consultarParametrosEjecucion_Req()