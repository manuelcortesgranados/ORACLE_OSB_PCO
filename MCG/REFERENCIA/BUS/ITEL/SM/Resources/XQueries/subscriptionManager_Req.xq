(:: pragma bea:global-element-return element="ns0:SubscriptionManagerRequest" location="../Schemas/PS_SUBSCRIPTION_MANAGER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/subscriptionManager";
declare namespace xf = "http://tempuri.org/ITEL/SM/Resources/XQueries/subscriptionManager_Req/";

declare function xf:subscriptionManager_Req($operacion as xs:string,
    $requestSM as xs:string)
    as element(ns0:SubscriptionManagerRequest) {
        <ns0:SubscriptionManagerRequest>
            <operacionSM>{ $operacion }</operacionSM>
            <requestSM>{ $requestSM }</requestSM>
        </ns0:SubscriptionManagerRequest>
};

declare variable $operacion as xs:string external;
declare variable $requestSM as xs:string external;

xf:subscriptionManager_Req($operacion,
    $requestSM)
