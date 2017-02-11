(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARHOSTID.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARHOSTID.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_HOSTID/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarHostId/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarHostId_Res/";

declare function xf:consultarHostId_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <UUID>{ data($outputParameters1/ns1:P_UUID) }</UUID>
                <HIDDESCRIPCION>{ data($outputParameters1/ns1:P_HIDDESCRIPCION) }</HIDDESCRIPCION>
                <HIDAREARESPONS>{ data($outputParameters1/ns1:P_HIDAREARESPONS) }</HIDAREARESPONS>
                <HIDESTADO>{ data($outputParameters1/ns1:P_HIDESTADO) }</HIDESTADO>
                <HIDUSUARIO>{ data($outputParameters1/ns1:P_HIDUSUARIO) }</HIDUSUARIO>
                <HIDFECHAREGISTRO>{ data($outputParameters1/ns1:P_HIDFECHAREGISTRO) }</HIDFECHAREGISTRO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:consultarHostId_Res($outputParameters1,
    $descripcion)