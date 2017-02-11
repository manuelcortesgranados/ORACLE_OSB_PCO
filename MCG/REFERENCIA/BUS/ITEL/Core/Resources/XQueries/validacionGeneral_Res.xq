(:: pragma bea:global-element-parameter parameter="$outputParameters" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_VALIDARGENERAL.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDACIONGENERAL.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_VALIDAR_GENERAL/";
declare namespace ns0 = "http://www.comcel.com.co/ValidacionGeneral/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validacionGeneral_Res/";

declare function xf:validacionGeneral_Res($outputParameters as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <CMDESCRIPCION>{ data($outputParameters/ns1:P_CMDESCRIPCION) }</CMDESCRIPCION>
                <CMTIMEOUTVALIDACION>{ data($outputParameters/ns1:P_CMTIMEOUTVALIDACION) }</CMTIMEOUTVALIDACION>
                <CMTIMEOUTCONSULTA>{ data($outputParameters/ns1:P_CMTIMEOUTCONSULTA) }</CMTIMEOUTCONSULTA>
                <CMTIMEOUTPROVISION>{ data($outputParameters/ns1:P_CMTIMEOUTPROVISION) }</CMTIMEOUTPROVISION>
                <CMTIMEOUTFINAL>{ data($outputParameters/ns1:P_CMTIMEOUTFINAL) }</CMTIMEOUTFINAL>
                <RMCCODIGOIN>{ data($outputParameters/ns1:P_RMCCODIGOIN) }</RMCCODIGOIN>
                <RMCMININICAL>{ data($outputParameters/ns1:P_RMCMININICIAL) }</RMCMININICAL>
                <RMCMINFINAL>{ data($outputParameters/ns1:P_RMCMINFINAL) }</RMCMINFINAL>
                <RMCESTADO>{ data($outputParameters/ns1:P_RMCESTADO) }</RMCESTADO>
                <PLATAFORMA>{ data($outputParameters/ns1:P_PLATAFORMA) }</PLATAFORMA>
                <CODERROR>{ data($outputParameters/ns1:P_COD_ERROR) }</CODERROR>
                <SDP>{ data($outputParameters/ns1:P_SDP) }</SDP>
            </MENSAJE>
            <DESCRIPCION>Validacion General</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters as element(ns1:OutputParameters) external;

xf:validacionGeneral_Res($outputParameters)