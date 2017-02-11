xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCANTIDADCONSULTASDIA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARCANTCONSULTAS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCantidadConsultasDia_Req/";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CANTCONSULTAS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarCantidadConsultasDia/";

declare function xf:consultarCantidadConsultasDia_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
    	<ns1:InputParameters>
    		<ns1:P_MIN>{xs:decimal( $input_Parameters1/MIN/text() )}</ns1:P_MIN>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarCantidadConsultasDia_Req($input_Parameters1)