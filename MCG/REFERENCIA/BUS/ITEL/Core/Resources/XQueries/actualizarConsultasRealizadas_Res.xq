(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_ACTUALIZAR_CANTCONSULTAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZARCANTIDADCONSULTASDIA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ActualizarCantidadConsultasDia/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_ACTUALIZAR_CANTCONSULTAS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/actualizarConsultasRealizadas_Res/";

declare function xf:actualizarConsultasRealizadas_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <ACTUALIZADO>{ data($outputParameters1/*:P_EXITO) }</ACTUALIZADO>
            </MENSAJE>
            <DESCRIPCION />
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:actualizarConsultasRealizadas_Res($outputParameters1)