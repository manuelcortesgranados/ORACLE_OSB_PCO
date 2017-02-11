(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARPARAMETRO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPARAMETROGENERAL.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarParametroGeneral/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_PARAMETROS/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarParametrosGenerales_Res/";

declare function xf:consultarParametrosGenerales_Res($outputParameters1 as element(ns0:OutputParameters),
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <PARVALOR>{ data($outputParameters1/ns0:P_PARVALOR) }</PARVALOR>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarParametrosGenerales_Res($outputParameters1,
    $descripcion)