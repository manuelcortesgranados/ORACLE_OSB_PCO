(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_OLMOFFERS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_OLMOFFERS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarOLMOffers/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_OLMOFFERS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarOLMOffers_Res/";

declare function xf:consultarOLMOffers_Res($outputParameters1 as element(ns0:OutputParameters), $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <OFFERNAME>{ data($outputParameters1/ns0:P_OFFERNAME) }</OFFERNAME>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarOLMOffers_Res($outputParameters1, $descripcion)