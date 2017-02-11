(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_NRN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_NRN.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_NRN/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarNRN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarNRN_Res/";

declare function xf:consultarNRN_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{if (data($outputParameters1/ns1:P_NRN)="")then
                "ERROR"
                else "OK"
            }</CODIGO>
            <MENSAJE>
                <NRN>{ data($outputParameters1/ns1:P_NRN) }</NRN>
            </MENSAJE>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarNRN_Res($outputParameters1)