(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ELIMINAR_CAMBIOS_FNF.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ELIMINAR_CAMBIOS_FNF.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/eliminarCambiosFNF";
declare namespace ns0 = "http://www.comcel.com.co/eliminarCambiosFNF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/eliminarCambiosFNF_Res/";

declare function xf:eliminarCambiosFNF_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <EXITO>{ data($outputParameters1/ns1:P_CANTIDAD) }</EXITO>
            </MENSAJE>
            <DESCRIPCION/>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:eliminarCambiosFNF_Res($outputParameters1)