xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTEMPSC.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarContractTemplate/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarConTempSC/";

declare function xf:validar_Req_consultarContractTemplate($tmcode as xs:string,
    $spcode as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<TMCODE>{ xs:decimal($tmcode) }</TMCODE>
        	<SPCODE>{ xs:decimal($spcode) }</SPCODE>
        </ns0:Input_Parameters>
};

declare variable $tmcode as xs:string external;
declare variable $spcode as xs:string external;

xf:validar_Req_consultarContractTemplate($tmcode, $spcode)