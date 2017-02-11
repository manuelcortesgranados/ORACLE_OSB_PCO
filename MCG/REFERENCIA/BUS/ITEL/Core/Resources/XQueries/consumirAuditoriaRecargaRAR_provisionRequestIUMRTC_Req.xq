(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../RTC/Resources/Schemas/PS_PROVISION_PAQUETE_DATOS_IUM_RTC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/provisionPaqueteDatosIUMRTC/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaRAR_provisionRequestIUMRTC_Req/";

declare function xf:consumirAuditoriaRecargaRAR_provisionRequestIUMRTC_Req($evemin as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <msisdn>{ $evemin }</msisdn>            
        </ns0:Input_Parameters>
};

declare variable $evemin as xs:string external;

xf:consumirAuditoriaRecargaRAR_provisionRequestIUMRTC_Req($evemin)