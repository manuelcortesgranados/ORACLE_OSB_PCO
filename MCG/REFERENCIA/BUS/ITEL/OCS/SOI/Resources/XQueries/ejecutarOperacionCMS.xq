xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$operacion" type="xs:anyType" ::)
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/ejecutarOperacionCMS/";

declare function xf:ejecutarOperacionCMS($operacion as element(*),
    $usuario as xs:string,
    $clave as xs:string)
    as element(*) {
            
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
	<soapenv:Header>
		<wsse:Security soapenv:mustUnderstand="1" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
			<wsse:UsernameToken wsu:Id="UsernameToken-1" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
				<wsse:Username>{data("ITEL")}</wsse:Username>
				<wsse:Password Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">{data("itel1passwd@")}</wsse:Password>
			</wsse:UsernameToken>
		</wsse:Security>
	</soapenv:Header>	 
	<soapenv:Body>
       {$operacion}	 
    </soapenv:Body>
</soapenv:Envelope>
};

declare variable $operacion as element(*) external;
declare variable $usuario as xs:string external;
declare variable $clave as xs:string external;

xf:ejecutarOperacionCMS($operacion,
    $usuario,
    $clave)
