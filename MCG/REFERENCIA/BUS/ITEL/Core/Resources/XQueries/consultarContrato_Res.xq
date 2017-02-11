(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTRATO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONTRATO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarContract";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTRACT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContract_Res/";

declare function xf:consultarContract_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <ns1:CODIGO>1</ns1:CODIGO>
            <ns1:MENSAJE>
                <ns1:CONTRACT>{ data($outputParameters1/ns0:P_CONTRACT) }</ns1:CONTRACT>
                <ns1:ESPOSTPAGO>{ data($outputParameters1/ns0:P_ESPOSTPAGO) }</ns1:ESPOSTPAGO>
            </ns1:MENSAJE>
            <ns1:DESCRIPCION />
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:consultarContract_Res($outputParameters1)