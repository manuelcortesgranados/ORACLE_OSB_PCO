(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA_ESPECIFICA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getSubscriberProductHistoryByMSISDNResponse" location="../WSDLs/Odm_BRMSWebService.wsdl" ::)

declare namespace ns2 = "http://data.brms.hp.com/xsd";
declare namespace ns1 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace ns0 = "http://axis.brms.hp.com";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ODM_BRMS_Res_getSubscriberProductHistoryByMSISDN/";

declare function xf:ODM_BRMS_Res_getSubscriberProductHistoryByMSISDN($wS_Result1 as element(ns1:WS_Result))
    as element(ns0:getSubscriberProductHistoryByMSISDNResponse) {
        <ns0:getSubscriberProductHistoryByMSISDNResponse>
            {
            	for $Paquete in $wS_Result1/MENSAJE/PARAMETROS/PARAMETRO/VALOR/PAQUETE
            	return        
            <ns0:return>
                <ns2:activationDate>{data($Paquete/FECHAINICIO)}</ns2:activationDate>
                <ns2:activationMethod></ns2:activationMethod>
                <ns2:chargeflag></ns2:chargeflag>
                <ns2:email></ns2:email>
                <ns2:expirationDate>{data($Paquete/FECHAFIN)}</ns2:expirationDate>
                <ns2:expirationNotice></ns2:expirationNotice>
                <ns2:imsi></ns2:imsi>
                <ns2:productBalance></ns2:productBalance>
                <ns2:productGroup></ns2:productGroup>
                <ns2:productId>{data($Paquete/PRODUCTID)}</ns2:productId>
                <ns2:programmedFlag></ns2:programmedFlag>
                <ns2:qosBalance></ns2:qosBalance>
                <ns2:qosDate></ns2:qosDate>
                <ns2:qosLimit></ns2:qosLimit>
                <ns2:qosPeriod></ns2:qosPeriod>
                <ns2:recurrentFlag></ns2:recurrentFlag>
                <ns2:region></ns2:region>
                <ns2:requestActivationDate></ns2:requestActivationDate>
                <ns2:requestCancelationDate></ns2:requestCancelationDate>
                <ns2:restrictedFlag></ns2:restrictedFlag>
                <ns2:statusId>{data($Paquete/ESTADO)}</ns2:statusId>
                <ns2:subscriberId>{data($Paquete/SUSCRIPCION)}</ns2:subscriberId>
                <ns2:subscriberProductId></ns2:subscriberProductId>
                <ns2:subscriberType></ns2:subscriberType>
            </ns0:return>
		}
        </ns0:getSubscriberProductHistoryByMSISDNResponse>
};

declare variable $wS_Result1 as element(ns1:WS_Result) external;

xf:ODM_BRMS_Res_getSubscriberProductHistoryByMSISDN($wS_Result1)
