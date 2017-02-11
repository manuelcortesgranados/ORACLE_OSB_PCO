(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_CONSULTAR_PAQUETE_DATOS_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:sendSmsSubscriberInformation" location="../Schemas/BS_CONSULTA_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ITEL/consultarPaqueteDatosRTC/";
declare namespace ns3 = "http://axis.brms.hp.com/xsd";
declare namespace ns0 = "http://axis.brms.hp.com";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/consultarPaqueteDatosRTC_Req/";

declare function xf:consultarPaqueteDatosRTC_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:sendSmsSubscriberInformation) {
        <ns0:sendSmsSubscriberInformation>    
                   <ns0:msisdn>{ concat( "57", data($input_Parameters1/msisdn)) }</ns0:msisdn>            
        </ns0:sendSmsSubscriberInformation>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarPaqueteDatosRTC_Req($input_Parameters1)