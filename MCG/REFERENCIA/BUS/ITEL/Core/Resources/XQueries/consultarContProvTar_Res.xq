(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTPROVTAR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONTPROVTAR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarContProvTar/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTPROVTAR/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContProvTar_Res/";

declare function xf:consultarContProvTar_Res($outputParameters1 as element(ns0:OutputParameters), $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <CONTRACT>{ data($outputParameters1/ns0:P_CONTRACT) }</CONTRACT>
                <PROVIDER>{ data($outputParameters1/ns0:P_PROVIDER) }</PROVIDER>
                <TARIFF>{ data($outputParameters1/ns0:P_TARIFF) }</TARIFF>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarContProvTar_Res($outputParameters1,
    $descripcion)