xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTRATO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarContrato/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarContract";

declare function xf:validar_Req_consultarContrato($tmcode as xs:string,
    $spcode as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<ns0:TMCODE>{ xs:decimal($tmcode) }</ns0:TMCODE>
        	<ns0:SPCODE>{ xs:decimal($spcode) }</ns0:SPCODE>
        </ns0:Input_Parameters>
};

declare variable $tmcode as xs:string external;
declare variable $spcode as xs:string external;

xf:validar_Req_consultarContrato($tmcode,
    $spcode)