xquery version "1.0" encoding "Cp1252";
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Computec/Resources/XQueries/getExternalCreditInformation_Req/";

declare function xf:getExternalCreditInformation_Req($user as xs:string, $password as xs:string, $documentType as xs:string, $documentNumber as xs:string, $lastName as xs:string)
    as element(*) {
        <ws:consultarHC  	xmlns:ws="http://ws.hc.dc.com" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/">
			<idsus xsi:type="soapenc:string">{$user}</idsus>
			<clasus xsi:type="soapenc:string">{$password}</clasus>
			<tipoid xsi:type="soapenc:string">{$documentType}</tipoid>
			<id xsi:type="soapenc:string">{$documentNumber}</id>
			<papellido xsi:type="soapenc:string">{$lastName}</papellido>
	</ws:consultarHC>
};

declare variable $user as xs:string external;
declare variable $password as xs:string external;
declare variable $documentType as xs:string external;
declare variable $documentNumber as xs:string external;
declare variable $lastName as xs:string external;

xf:getExternalCreditInformation_Req($user, $password, $documentType, $documentNumber, $lastName)
