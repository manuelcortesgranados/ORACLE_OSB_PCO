(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../RTC/Resources/Schemas/PS_PROVISION_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ProvisionPaqueteDatosRTC/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaDatos_provisionPaqueteDatosRTC_Req/";

declare function xf:consumirAuditoriaRecargaDatos_provisionPaqueteDatosRTC_Req($evemin as xs:string,
    $bono as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <msisdn>{ $evemin }</msisdn>
            <activationRequest>
                <productId>{ $bono }</productId>
            </activationRequest>
        </ns0:Input_Parameters>
};

declare variable $evemin as xs:string external;
declare variable $bono as xs:string external;

xf:consumirAuditoriaRecargaDatos_provisionPaqueteDatosRTC_Req($evemin,
    $bono)