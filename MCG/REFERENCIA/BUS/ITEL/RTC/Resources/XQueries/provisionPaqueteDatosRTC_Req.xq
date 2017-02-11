(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_PROVISION_PAQUETE_DATOS_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:addSubscriptionToSubscriber" location="../Schemas/BS_PROVISION_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ProvisionPaqueteDatosRTC/";
declare namespace ns3 = "http://axis.brms.hp.com/xsd";
declare namespace ns0 = "http://axis.brms.hp.com";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionPaqueteDatosRTC_Req/";

declare function xf:provisionPaqueteDatosRTC_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:addSubscriptionToSubscriber) {
        <ns0:addSubscriptionToSubscriber>           
            <ns0:msisdn>{ concat( "57", data($input_Parameters1/msisdn)) }</ns0:msisdn>
            <ns0:activationRequest>
                <ns3:isProgrammed>false</ns3:isProgrammed>
                <ns3:maxRecurrenceNum>0</ns3:maxRecurrenceNum>
                <ns3:messageId></ns3:messageId>
                <ns3:productId>{ data($input_Parameters1/activationRequest/productId) }</ns3:productId>
                <ns3:programmedDate/>
                <ns3:recurrence>0</ns3:recurrence>
                <ns3:welcomePackageID/>
            </ns0:activationRequest>
            <ns0:applicationId>BRMS</ns0:applicationId>
            <ns0:mail/>
        </ns0:addSubscriptionToSubscriber>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:provisionPaqueteDatosRTC_Req($input_Parameters1)