(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_NOTIFICACION_SMS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/NotificacionSMSITEL/";
declare namespace ns1 = "http://www.comcel.com.co/EnviarSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirNotificacionSMS_enviaSMS_Req/";

declare function xf:consumirNotificacionSMS_enviaSMS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
    let $enddate := fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ssZ",data($input_Parameters1/OFFERENDDATE)) - xdt:dayTimeDuration("PT5H")
    let $msgdate := replace (data($input_Parameters1/MENSAJE),"xx/xx/xxx",fn-bea:dateTime-to-string-with-format("dd/MM/yyyy",$enddate))
    let $msgtime := replace ($msgdate,"XX:XX",fn-bea:dateTime-to-string-with-format("HH:mm",$enddate))
    return
        <ns1:Input_Parameters>
            <MIN>{ substring(data($input_Parameters1/DESTINO),3) }</MIN>
            <MENSAJE>{ $msgtime }</MENSAJE>
            <ORIGEN>{ data($input_Parameters1/ORIGEN) }</ORIGEN>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consumirNotificacionSMS_enviaSMS_Req($input_Parameters1)