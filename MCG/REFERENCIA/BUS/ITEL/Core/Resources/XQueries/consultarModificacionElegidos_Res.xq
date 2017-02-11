(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_MODELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_MODIFICACION_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/consultarModificacionElegidos/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSTEM/PKG_SOA_ITEL/PRC_CONSULTAR_MODELEGIDOS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarModificacionElegidos_Res/";

declare function xf:consultarModificacionElegidos_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <CANTIDAD_MODIFICACION_ELEGIDOS>{ data($outputParameters1/ns0:P_CANTIDAD) }</CANTIDAD_MODIFICACION_ELEGIDOS>
                <ELEGIDOS_MODIFICADOS>{ data($outputParameters1/ns0:P_ELEGIDOS) }</ELEGIDOS_MODIFICADOS>
            </MENSAJE>
            <DESCRIPCION/>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:consultarModificacionElegidos_Res($outputParameters1)