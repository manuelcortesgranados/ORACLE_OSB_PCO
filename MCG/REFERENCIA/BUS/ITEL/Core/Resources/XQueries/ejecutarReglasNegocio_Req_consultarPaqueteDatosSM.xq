(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../RTC/Resources/Schemas/PS_CONSULTAR_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/SubscriptionRetrieveSM/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_consultarPaqueteDatosSM/";

declare function xf:ejecutarReglasNegocio_Req_consultarPaqueteDatosSM($min as xs:string, $credenciales as xs:string)
    as element(ns0:Input_Parameters) {
    	let $cred := fn:tokenize($credenciales,'\|')
    	return
        <ns0:Input_Parameters>
            <msisdn>{ concat ('57',$min) }</msisdn>
            <user>{ $cred[1] }</user>
            <password>{ $cred[2]}</password>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $credenciales as xs:string external;

xf:ejecutarReglasNegocio_Req_consultarPaqueteDatosSM($min, $credenciales)
