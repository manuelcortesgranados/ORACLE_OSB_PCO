(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_ELIMINAR_ELEGIDO_ILIM_FIJO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ELIMINAR_ELEGIDOILIMITADO_FIJO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_ELIMINAR_ELEGIDO_ILIM_FIJO/";
declare namespace ns0 = "http://www.comcel.com.co/PS_ELIMINAR_ELEGIDOILIMITADO_FIJO";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/eliminarElegidoIlimitadoFijo_Res/";

declare function xf:eliminarElegidoIlimitadoFijo_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                <EXITO>{ data($outputParameters1/ns1:P_EXITO) }</EXITO>
            </MENSAJE>
            <DESCRIPCION />
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:eliminarElegidoIlimitadoFijo_Res($outputParameters1)