(:: pragma  parameter="$resultadoSM" type="anyType" ::)
(:: pragma bea:global-element-return element="ns0:SubscriptionManagerResponse" location="../Schemas/PS_SUBSCRIPTION_MANAGER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/subscriptionManager";
declare namespace xf = "http://tempuri.org/ITEL/SM/Resources/XQueries/subscriptionManager_Res/";

declare function xf:subscriptionManager_Res($resultadoSM as element(*))
    as element(ns0:SubscriptionManagerResponse) {
        <ns0:SubscriptionManagerResponse>
            <codigo>
              {
                if(data($resultadoSM//resultCode/resultCode) = '0') then 1
                  else data($resultadoSM//resultCode/resultCode) 
              }
            </codigo>
            <descripcion>{ data($resultadoSM//resultCode/resultDescription) }</descripcion>
            <resultado>{ $resultadoSM/@* , $resultadoSM/node() }</resultado>
        </ns0:SubscriptionManagerResponse>
};

declare variable $resultadoSM as element(*) external;

xf:subscriptionManager_Res($resultadoSM)
