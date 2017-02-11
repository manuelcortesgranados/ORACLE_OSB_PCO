(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_FAFIDVIGENCIA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARFAFIDVIGENCIA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarFAFIDVigencia";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_FAFID_VIGENCIA/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFAFIDVigencia_Res/";

declare function xf:consultarFAFIDVigencia_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <FAFID>{ data($outputParameters1/ns0:P_FAFID) }</FAFID>
            </MENSAJE>
            <DESCRIPCION />
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:consultarFAFIDVigencia_Res($outputParameters1)