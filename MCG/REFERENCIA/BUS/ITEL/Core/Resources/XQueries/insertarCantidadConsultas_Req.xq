xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTARCANTIDADCONSULTASDIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_CANTCONSULTAS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarCantidadConsultas_Req/";
declare namespace ns1 = "http://www.comcel.com.co/InsertarCantidadConsultasDia/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_CANTCONSULTAS/";

declare function xf:insertarCantidadConsultas_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
         <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
         <ns0:P_REALIZADAS>{ data($input_Parameters1/CONSULTASREALIZADAS) }</ns0:P_REALIZADAS>
         <ns0:P_GRATIS>{ data($input_Parameters1/CONSULTASGRATIS) }</ns0:P_GRATIS>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarCantidadConsultas_Req($input_Parameters1)