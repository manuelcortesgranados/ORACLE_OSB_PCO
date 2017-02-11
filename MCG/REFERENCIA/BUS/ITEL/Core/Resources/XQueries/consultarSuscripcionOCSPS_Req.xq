xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarSuscripcionOCSPS_Req/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";

declare function xf:consultarSuscripcionOCSPS_Req($min as xs:string)
as element(ns0:Input_Parameters) {
	<ns0:Input_Parameters>
		<REQUESTID>{ "0" }</REQUESTID>
    	<OPERATION>{ "getSubscriptions" }</OPERATION>
    	<PRODUCTNAME>{ "*" }</PRODUCTNAME>
    	<SUBSCRIBERID>{ "0" }</SUBSCRIBERID>
    	<MSISDN>{ concat("57" ,$min) }</MSISDN>
    	<SUBSCRIPTIONSTATUS>{ "all" }</SUBSCRIPTIONSTATUS>
    	<FROMDATE>{ concat(fn-bea:date-to-string-with-format("yyyyMMdd", fn:current-date()),"000000") }</FROMDATE>
    	<TODATE>{ concat(fn-bea:date-to-string-with-format("yyyyMMdd", fn:current-date()), "235959") }</TODATE>
    	<GETVOLUME>{ "no" }</GETVOLUME>
    </ns0:Input_Parameters>
    
};

declare variable $min as xs:string external;

xf:consultarSuscripcionOCSPS_Req($min)