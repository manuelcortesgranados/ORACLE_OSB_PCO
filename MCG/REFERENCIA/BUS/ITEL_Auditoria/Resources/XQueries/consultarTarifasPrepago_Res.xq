(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTARTARIFAPREPAGO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARTARIFAPREPAGO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL2/PRC_CONSULTAR_TARIFAPREPAGO/";
declare namespace ns0 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consultarTarifasPrepago_Res/";

declare function xf:consultarTarifasPrepago_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <MENSAJE>
                <TARIFA_VOZ>{ data($outputParameters1/ns1:P_TARIFA_VOZ) }</TARIFA_VOZ>
                <TARIFA_SMS>{ data($outputParameters1/ns1:P_TARIFA_SMS) }</TARIFA_SMS>
                <TARIFA_DATOS>{ data($outputParameters1/ns1:P_TARIFA_DATOS) }</TARIFA_DATOS>
            </MENSAJE>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarTarifasPrepago_Res($outputParameters1)