(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_VIG_ELEGIDOSMS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARVIGENCIAELEGIDOSMS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_VIG_ELEGIDOSMS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarVigenciaElegidoSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarVigenciaElegidoSMS_Res/";

declare function xf:consultarVigenciaElegidoSMS_Res($outputParameters1 as element(ns1:OutputParameters))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <VIGENCIA>{ data($outputParameters1/ns1:P_VIGENCIA) }</VIGENCIA>
                <FECHA_CREACION>{ data($outputParameters1/ns1:P_FECHA_CREACION) }</FECHA_CREACION>
                <FECHA_EXPIRACION>{ data($outputParameters1/ns1:P_FECHA_EXPIRACION) }</FECHA_EXPIRACION>
                <SUSCRIPCION>{ data($outputParameters1/ns1:P_SUSCRIPCION) }</SUSCRIPCION>
            </MENSAJE>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:consultarVigenciaElegidoSMS_Res($outputParameters1)