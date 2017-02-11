(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/MS_ITEL_NOTIFICACION_SMS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONECTOR_SMPP.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/NotificacionSMSITEL/";
declare namespace ns1 = "http://www.comcel.com.co/conectorSMPP/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirNotificacionSMS_conectorSMPP_Req/";

declare function xf:consumirNotificacionSMS_conectorSMPP_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <ORIGEN>{ data($input_Parameters1/ORIGEN) }</ORIGEN>
            <DESTINO>{ data($input_Parameters1/DESTINO) }</DESTINO>
            <MENSAJE>{ concat( data($input_Parameters1/OFFERID),',',data($input_Parameters1/OFFERSTARTDATE),',',data($input_Parameters1/OFFERENDDATE),',',data($input_Parameters1/USAGECOUNTERVALUE),',',data($input_Parameters1/USAGECOUNTERLEVEL)) }</MENSAJE>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consumirNotificacionSMS_conectorSMPP_Req($input_Parameters1)
