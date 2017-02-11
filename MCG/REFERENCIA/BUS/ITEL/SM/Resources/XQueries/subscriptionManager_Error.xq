(:: pragma bea:global-element-return element="ns0:SubscriptionManagerResponse" location="../Schemas/PS_SUBSCRIPTION_MANAGER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/subscriptionManager";
declare namespace xf = "http://tempuri.org/ITEL/SM/Resources/XQueries/subscriptionManager_Error/";

declare function xf:subscriptionManager_Error($codigoError as xs:string,
    $descripcionError as xs:string)
    as element(ns0:SubscriptionManagerResponse) {
        <ns0:SubscriptionManagerResponse>
            <codigo>{ $codigoError }</codigo>
            <descripcion>{ $descripcionError }</descripcion>
            <resultado/>
        </ns0:SubscriptionManagerResponse>
};

declare variable $codigoError as xs:string external;
declare variable $descripcionError as xs:string external;

xf:subscriptionManager_Error($codigoError,
    $descripcionError)
