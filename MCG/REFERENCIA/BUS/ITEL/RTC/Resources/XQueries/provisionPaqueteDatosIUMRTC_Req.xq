(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_PROVISION_PAQUETE_DATOS_IUM_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ReAuthorizationRequest" location="../Schemas/BS_PROVISION_PAQUETE_DATOS_IUM_RTC.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ITEL/provisionPaqueteDatosIUMRTC/";
declare namespace ns3 = "http://events.redirect.hp.com/xsd";
declare namespace ns0 = "http://events.redirect.hp.com";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionPaqueteDatosIUMRTC_Req/";

declare function xf:provisionPaqueteDatosIUMRTC_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:ReAuthorizationRequest) {
       <ns0:ReAuthorizationRequest>
         <ns0:msisdn>{ concat( "57", data($input_Parameters1/msisdn)) }</ns0:msisdn>
      </ns0:ReAuthorizationRequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:provisionPaqueteDatosIUMRTC_Req($input_Parameters1)