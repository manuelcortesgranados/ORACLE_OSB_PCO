(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARRANGOMIN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RANGO_MIN/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarRangoMin_Res/";

declare function xf:consultarRangoMin_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <RMCCODIGOIN>{ data($outputParameters1/ns1:P_RMCCODIGOIN) }</RMCCODIGOIN>
                <RMCMININICAL>{ data($outputParameters1/ns1:P_RMCMININICIAL) }</RMCMININICAL>
                <RMCMINFINAL>{ data($outputParameters1/ns1:P_RMCMINFINAL) }</RMCMINFINAL>
                <RMCESTADO>{ data($outputParameters1/ns1:P_RMCESTADO) }</RMCESTADO>
                <PLATAFORMA>{ data($outputParameters1/ns1:P_PLATAFORMA) }</PLATAFORMA>
                <SDP>{ data($outputParameters1/ns1:P_SDP) }</SDP>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarRangoMin_Res($outputParameters1,
    $descripcion)