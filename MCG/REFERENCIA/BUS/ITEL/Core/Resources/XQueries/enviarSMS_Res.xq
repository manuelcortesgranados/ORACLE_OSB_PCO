(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_ENVIAR_SMS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EnviarSMS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSTEM/PRC_ENVIAR_SMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/enviarSMS_Res/";

declare function xf:enviarSMS_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>1</CODIGO>
            <MENSAJE>
                <SQLCODE>{ data($outputParameters1/ns0:v_sqlCode) }</SQLCODE>
                <DESCRIPCION>{ data($outputParameters1/ns0:v_sqlErrDesc) }</DESCRIPCION>
            </MENSAJE>
            <DESCRIPCION/>
        </ns1:WS_Result>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:enviarSMS_Res($outputParameters1)