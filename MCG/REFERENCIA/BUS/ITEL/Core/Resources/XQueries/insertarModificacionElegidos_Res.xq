(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_INSERTAR_MODELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_INSERTAR_MODIFICACION_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSTEM/PKG_SOA_ITEL/PRC_INSERTAR_MODELEGIDOS/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarModificacionElegidos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/WSDLs/insertarModificacionElegidos_Res/";

declare function xf:insertarModificacionElegidos_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <RESULTADO>{ data($outputParameters1/ns1:P_RESULT) }</RESULTADO>
            </MENSAJE>
            <DESCRIPCION/>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:insertarModificacionElegidos_Res($outputParameters1)