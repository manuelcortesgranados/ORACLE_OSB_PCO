(:: pragma bea:global-element-parameter parameter="$outputParameters" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARESTADORECARGA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARESTADORECARGA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_ESTADORECARGA/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarEstadoRecarga/";
declare namespace xf = "http://tempuri.org/ITEL/Trama500/Resources/XQueries/consultarEstaroRecarga_Res/";

declare function xf:consultarEstaroRecarga_Res($outputParameters as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	{if (data($outputParameters/ns1:P_RESPUESTA) != "") then
        		<CODIGO>1</CODIGO>
        	else
        		<CODIGO>937</CODIGO>
            }
            <MENSAJE>
                <RESPUESTA>{ data($outputParameters/ns1:P_RESPUESTA) }</RESPUESTA>
            </MENSAJE>
            <DESCRIPCION>Consulta ejecutada exitosamente</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters as element(ns1:OutputParameters) external;

xf:consultarEstaroRecarga_Res($outputParameters)