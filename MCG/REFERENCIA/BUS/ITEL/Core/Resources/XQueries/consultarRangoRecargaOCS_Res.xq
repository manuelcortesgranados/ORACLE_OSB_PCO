(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_RANGORECARGA_OCS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_RANGORECARGA_OCS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoRecargaOCS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_RANGORECARGA_OCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRangoRecargaOCS_Res/";

declare function xf:consultarRangoRecargaOCS_Res($outputParameters1 as element(ns0:OutputParameters), $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <BONO>{ data($outputParameters1/ns0:P_BONO) }</BONO>
                <VIGENCIA>{ data($outputParameters1/ns0:P_VIGENCIA) }</VIGENCIA>
            </MENSAJE>
            <DESCRIPCION>{$descripcion}</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarRangoRecargaOCS_Res($outputParameters1, $descripcion)