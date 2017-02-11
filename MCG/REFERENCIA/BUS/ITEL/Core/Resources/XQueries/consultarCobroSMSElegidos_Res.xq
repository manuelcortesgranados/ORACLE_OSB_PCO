(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_COBRO_SMS_ELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCOBROSMSELEGIDOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_COBRO_SMS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarCobroSMSElegidos";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCobroSMSElegidos_Res/";

declare function xf:consultarCobroSMSElegidos_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        <ns0:CODIGO>1</ns0:CODIGO>
            <ns0:MENSAJE>
                <ns0:VALOR>{ data($outputParameters1/ns1:P_VALOR) }</ns0:VALOR>
            </ns0:MENSAJE>
            <ns0:DESCRIPCION />
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarCobroSMSElegidos_Res($outputParameters1)