(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_CANTCONSULTAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_INSERTARCANTIDADCONSULTASDIA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarCantidadConsultasDia/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_CANTCONSULTAS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarCantidadConsultas_Res/";

declare function xf:insertarCantidadConsultas_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <EXITO>{ data($outputParameters1/ns0:P_EXITO) }</EXITO>
            </MENSAJE>
            <DESCRIPCION />
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:insertarCantidadConsultas_Res($outputParameters1)