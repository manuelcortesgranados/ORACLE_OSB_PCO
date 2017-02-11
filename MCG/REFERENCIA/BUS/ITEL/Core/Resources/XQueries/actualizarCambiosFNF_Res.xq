(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ACTUALIZAR_CAMBIOS_FNF.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_CAMBIOS_FNF.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/actualizarCambiosFNF/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/actualizarCambiosFNF";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/actualizarCambiosFNF_Res/";

declare function xf:actualizarCambiosFNF_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <RESULTADO>{ data($outputParameters1/ns0:P_RESULT) }</RESULTADO>
            </MENSAJE>
            <DESCRIPCION/>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:actualizarCambiosFNF_Res($outputParameters1)