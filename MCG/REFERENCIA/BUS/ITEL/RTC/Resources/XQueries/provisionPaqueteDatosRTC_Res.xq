(:: pragma bea:global-element-parameter parameter="$addSubscriptionToSubscriberResponse1" element="ns1:addSubscriptionToSubscriberResponse" location="../Schemas/BS_PROVISION_PAQUETE_DATOS_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_PROVISION_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns1 = "http://axis.brms.hp.com";
declare namespace ns0 = "http://www.comcel.com.co/ProvisionPaqueteDatosRTC/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionPaqueteDatosRTC_Res/";

declare function xf:provisionPaqueteDatosRTC_Res($addSubscriptionToSubscriberResponse1 as element(ns1:addSubscriptionToSubscriberResponse))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ if(data($addSubscriptionToSubscriberResponse1/ns1:return/*:errorCode) = '0') then '1' else '63' }</CODIGO>
            <MENSAJE>
                {
                    for $billingId in $addSubscriptionToSubscriberResponse1/ns1:return/*:billingId
                    return
                        <billingId>{ data($billingId) }</billingId>
                }
                {
                    for $errorCode in $addSubscriptionToSubscriberResponse1/ns1:return/*:errorCode
                    return
                        <errorCode>{ data($errorCode) }</errorCode>
                }
                {
                    for $errorDescription in $addSubscriptionToSubscriberResponse1/ns1:return/*:errorDescription
                    return
                        <errorDescription>{ data($errorDescription) }</errorDescription>
                }
                {
                    for $statusCode in $addSubscriptionToSubscriberResponse1/ns1:return/*:statusCode
                    return
                        <statusCode>{ data($statusCode) }</statusCode>
                }
            </MENSAJE>
            <DESCRIPCION>Operacion Ejecutada</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $addSubscriptionToSubscriberResponse1 as element(ns1:addSubscriptionToSubscriberResponse) external;

xf:provisionPaqueteDatosRTC_Res($addSubscriptionToSubscriberResponse1)