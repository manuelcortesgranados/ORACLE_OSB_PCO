(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_RANGOSDP.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRANGOSDP.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoSDP/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RANGO_SDP/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRangoSDP_Res/";

declare function xf:consultarRangoSDP_Res($outputParameters1 as element(ns0:OutputParameters),
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <RSCODIGOSDP>{ data($outputParameters1/ns0:P_RSCODIGOSDP) }</RSCODIGOSDP>
                <RSCMININICIAL>{ data($outputParameters1/ns0:P_RSCMININICIAL) }</RSCMININICIAL>
                <RSCMINFINAL>{ data($outputParameters1/ns0:P_RSCMINFINAL) }</RSCMINFINAL>
                <RSCESTADO>{ data($outputParameters1/ns0:P_RSCESTADO) }</RSCESTADO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarRangoSDP_Res($outputParameters1,
    $descripcion)