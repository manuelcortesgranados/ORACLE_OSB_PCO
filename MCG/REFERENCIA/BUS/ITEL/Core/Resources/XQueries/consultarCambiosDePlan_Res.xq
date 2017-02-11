(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CAMBIOSDEPLAN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_CAMBIOS_DE_PLAN.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSTEM/PKG_SOA_ITEL/PRC_CONSULTAR_CAMBIOSDEPLAN/";
declare namespace ns0 = "http://www.comcel.com.co/consultarCambiosDePlan/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCambiosDePlan_Res/";

declare function xf:consultarCambiosDePlan_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <CANTIDAD_CAMBIOS_PLAN>{ data($outputParameters1/ns1:P_CANTIDAD) }</CANTIDAD_CAMBIOS_PLAN>
            </MENSAJE>
            <DESCRIPCION/>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarCambiosDePlan_Res($outputParameters1)