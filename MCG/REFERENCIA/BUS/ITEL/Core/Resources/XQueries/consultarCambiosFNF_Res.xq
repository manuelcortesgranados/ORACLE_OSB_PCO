(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_CONSULTA_CAMBIOS_FNF.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_CAMBIOS_FNF.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/consultarCambiosFNF";
declare namespace ns0 = "http://www.comcel.com.co/consultarCambiosFNF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCambiosFNF_Res/";

declare function xf:consultarCambiosFNF_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <CANTIDAD_CAMBIOS_FNF>{ data($outputParameters1/ns1:P_CANTIDAD) }</CANTIDAD_CAMBIOS_FNF>
            </MENSAJE>
            <DESCRIPCION/>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarCambiosFNF_Res($outputParameters1)