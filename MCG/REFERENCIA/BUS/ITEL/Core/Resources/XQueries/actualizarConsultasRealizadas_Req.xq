xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZARCANTIDADCONSULTASDIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_ACTUALIZAR_CANTCONSULTAS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/actualizarConsultasRealizadas_Req/";
declare namespace ns1 = "http://www.comcel.com.co/ActualizarCantidadConsultasDia/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_ACTUALIZAR_CANTCONSULTAS/";

declare function xf:actualizarConsultasRealizadas_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
        	<ns0:P_MIN>{ xs:decimal( $input_Parameters1/MIN/text() ) }</ns0:P_MIN>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:actualizarConsultasRealizadas_Req($input_Parameters1)