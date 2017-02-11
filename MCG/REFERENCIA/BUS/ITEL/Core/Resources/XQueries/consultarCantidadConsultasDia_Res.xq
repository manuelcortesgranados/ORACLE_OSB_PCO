xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARCANTCONSULTAS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCANTIDADCONSULTASDIA.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCantidadConsultasDia_Res/";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CANTCONSULTAS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarCantidadConsultasDia/";

declare function xf:consultarCantidadConsultasDia_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        <ns0:CODIGO>1</ns0:CODIGO>
        	<ns0:MENSAJE>
        		<ns0:CONSULTASREALIZADAS>
        		{ data($outputParameters1/*:P_CONSULTASREALIZADAS) }
        		</ns0:CONSULTASREALIZADAS>
        		<ns0:CONSULTASGRATIS>
        		{ data($outputParameters1/*:P_CONSULTASGRATIS) }
        		</ns0:CONSULTASGRATIS>
        	</ns0:MENSAJE>
        <ns0:DESCRIPCION />
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarCantidadConsultasDia_Res($outputParameters1)