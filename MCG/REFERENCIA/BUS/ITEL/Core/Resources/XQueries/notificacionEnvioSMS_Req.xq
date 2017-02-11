(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_NOTIF_ENVIAR_SMS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/NotificacionEnvioSMS/";
declare namespace ns0 = "http://www.comcel.com.co/EnviarSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/notificacionEnvioSMS_Req/";

declare function xf:notificacionEnvioSMS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/MIN) }</MIN>
            <MENSAJE>{ data($input_Parameters1/MENSAJE) }</MENSAJE>
            <ORIGEN>{ data($input_Parameters1/ORIGEN) }</ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:notificacionEnvioSMS_Req($input_Parameters1)
