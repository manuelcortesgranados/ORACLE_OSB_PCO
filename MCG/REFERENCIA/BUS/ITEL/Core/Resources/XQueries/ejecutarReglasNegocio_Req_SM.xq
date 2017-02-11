(:: pragma bea:global-element-return element="ns0:SubscriptionManagerRequest" location="../../../SM/Resources/Schemas/CONSULTA_CATALOGO_BS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/subscriptionManager";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_SM/";

declare function xf:ejecutarReglasNegocio_Req_SM($operacion as xs:string,
    $consultaSM as xs:string)
    as element(ns0:SubscriptionManagerRequest) {
        <ns0:SubscriptionManagerRequest>
            <operacionSM>{ $operacion }</operacionSM>
            <requestSM>{ $consultaSM }</requestSM>
        </ns0:SubscriptionManagerRequest>
};

declare variable $operacion as xs:string external;
declare variable $consultaSM as xs:string external;

xf:ejecutarReglasNegocio_Req_SM($operacion,
    $consultaSM)
