(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_NOTIFICACION_SMS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_NOTIFICACION_SMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/NotificacionSMS/";
declare namespace ns1 = "http://www.comcel.com.co/NotificacionSMSITEL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/notificacionSMS_Req/";

declare function xf:notificacionSMS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <ORIGEN>{ data($input_Parameters1/ORIGEN) }</ORIGEN>
            <DESTINO>{ data($input_Parameters1/DESTINO) }</DESTINO>
            <OFFERID>{ data($input_Parameters1/OFFERID) }</OFFERID>
            <OFFERSTARTDATE>{ data($input_Parameters1/OFFERSTARTDATE) }</OFFERSTARTDATE>
            <OFFERENDDATE>{ data($input_Parameters1/OFFERENDDATE) }</OFFERENDDATE>
            <USAGECOUNTERVALUE>{ data($input_Parameters1/USAGECOUNTERVALUE) }</USAGECOUNTERVALUE>
            <USAGECOUNTERLEVEL>{ data($input_Parameters1/USAGECOUNTERLEVEL) }</USAGECOUNTERLEVEL>
            <MENSAJE>{ data($input_Parameters1/MENSAJE) }</MENSAJE>
            <TIPONOTIFICACION>{ data($input_Parameters1/TIPONOTIFICACION) }</TIPONOTIFICACION>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:notificacionSMS_Req($input_Parameters1)
