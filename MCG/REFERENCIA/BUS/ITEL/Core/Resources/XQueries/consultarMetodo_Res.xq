(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARMETODO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARMETODO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_METODO/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarMetodos/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarMetodo_Res/";

declare function xf:consultarMetodo_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <CMDESCRIPCION>{ data($outputParameters1/ns1:P_CMDESCRIPCION) }</CMDESCRIPCION>
                <CMTIMEOUTVALIDACION>{ data($outputParameters1/ns1:P_CMTIMEOUTVALIDACION) }</CMTIMEOUTVALIDACION>
                <CMTIMEOUTCONSULTA>{ data($outputParameters1/ns1:P_CMTIMEOUTCONSULTA) }</CMTIMEOUTCONSULTA>
                <CMTIMEOUTPROVISION>{ data($outputParameters1/ns1:P_CMTIMEOUTPROVISION) }</CMTIMEOUTPROVISION>
                <CMTIMEOUTFINAL>{ data($outputParameters1/ns1:P_CMTIMEOUTFINAL) }</CMTIMEOUTFINAL>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarMetodo_Res($outputParameters1,
    $descripcion)