(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_MERCADEO_OCS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_MERCADEO_OCS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_MERCADEO_OCS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarMercadeoOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarMercadeoOCS_Resp/";

declare function xf:consultarMercadeoOCS_Resp($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <OFFERID_OLM>{ data($outputParameters1/ns1:P_OFFERIDOLM) }</OFFERID_OLM>
                <OFFERID_AIR>{ data($outputParameters1/ns1:P_OFFERIDAIR) }</OFFERID_AIR>
                <BLOQUEA>{ data($outputParameters1/ns1:P_BLOQUEA) }</BLOQUEA>
                <EXITO>{ data($outputParameters1/ns1:P_EXITO) }</EXITO>
            </MENSAJE>
            <DESCRIPCION> { $descripcion } </DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarMercadeoOCS_Resp($outputParameters1, $descripcion)