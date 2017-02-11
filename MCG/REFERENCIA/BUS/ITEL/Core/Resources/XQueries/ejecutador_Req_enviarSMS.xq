xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_enviarSMS/";
declare namespace ns0 = "http://www.comcel.com.co/EnviarSMS/";

declare function xf:ejecutador_Req_enviarSMS($min as xs:string,
    $mensaje as xs:string,
    $origen as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<MIN>{ $min }</MIN>
        	<MENSAJE>{ $mensaje }</MENSAJE>
            <ORIGEN>{ $origen }</ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $origen as xs:string external;

xf:ejecutador_Req_enviarSMS($min,
    $mensaje,
    $origen)