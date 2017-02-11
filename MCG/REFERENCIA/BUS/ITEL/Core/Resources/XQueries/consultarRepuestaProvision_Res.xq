(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_RESPUESTA_PROV.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_RESPUESTA_PROVISION.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_RESPUESTA_PROV/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRespuestaProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRepuestaProvision_Res/";

declare function xf:consultarRepuestaProvision_Res($outputParameters1 as element(ns1:OutputParameters), 
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

xf:consultarRepuestaProvision_Res($outputParameters1, 
	$descripcion)