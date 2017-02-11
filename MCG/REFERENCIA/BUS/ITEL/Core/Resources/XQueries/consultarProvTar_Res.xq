(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARPROVTAR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPROVTAR.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_PROV_TAR/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarProvTar/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarProvTar_Res/";

declare function xf:consultarProvTar_Res($outputParameters1 as element(ns1:OutputParameters), $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <PROVIDER>{ data($outputParameters1/ns1:P_PROVIDER) }</PROVIDER>
                <TARIFF>{ data($outputParameters1/ns1:P_TARIFF) }</TARIFF>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarProvTar_Res($outputParameters1, $descripcion)