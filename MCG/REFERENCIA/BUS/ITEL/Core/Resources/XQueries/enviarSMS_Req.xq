(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EnviarSMS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSTEM/PRC_ENVIAR_SMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/enviarSMS_Req/";

declare function xf:enviarSMS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
        	<ns0:v_puertoIn>{ "10" }</ns0:v_puertoIn>
            <ns0:v_origen>{ data($input_Parameters1/ORIGEN) }</ns0:v_origen>
            <ns0:v_destino>{ data($input_Parameters1/MIN) }</ns0:v_destino>
        	<ns0:v_msg>{ data($input_Parameters1/MENSAJE) }</ns0:v_msg>
            <ns0:v_horaExp>{ "0" }</ns0:v_horaExp>
            <ns0:v_minutoExp>{ "20" }</ns0:v_minutoExp>
            <ns0:v_anualEntrega>{ "10" }</ns0:v_anualEntrega>
            <ns0:v_mes_entrega>{ "10" }</ns0:v_mes_entrega>
            <ns0:v_dia_entrega>{ "10" }</ns0:v_dia_entrega>
            <ns0:v_hora_entrega>{ "10" }</ns0:v_hora_entrega>
            <ns0:v_minuto_entrega>{ "10" }</ns0:v_minuto_entrega>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:enviarSMS_Req($input_Parameters1)