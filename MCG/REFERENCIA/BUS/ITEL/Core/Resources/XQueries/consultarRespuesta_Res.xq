(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARRESPUESTA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARRESPUESTA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_RESPUESTAS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRespuesta/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarRespuesta_Res/";

declare function xf:consultarRespuesta_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <CODIGO>{ data($outputParameters1/ns1:P_CODIGO) }</CODIGO>
                <RESDESCRIPCION>{ data($outputParameters1/ns1:P_RESDESCRIPCION) }</RESDESCRIPCION>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarRespuesta_Res($outputParameters1,
    $descripcion)