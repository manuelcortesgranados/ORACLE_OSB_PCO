xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$reglasNegocio" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama205/";
declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
    if ($expiryDate = "99991231T12:00:00+0000") then     
     concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", "19700101T23:59:59+0000")), " 23:59:59")
    else     
	 concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:adaptarParametrosSalidaTrama205($reglasNegocio as element(ns2:WS_Result))
    as xs:string {
        let $cuentas:=  $reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts
        let $cuenta := fn:string-join(for $dato in $cuentas/Detail
                       return
                        fn:concat(data($dato/Name),";",data($dato/Balance),";",xf:expiryDateFormatter($dato/ExpiryDate)),";")
       
        return 
          $cuenta
};

declare variable $reglasNegocio as element(ns2:WS_Result) external;


xf:adaptarParametrosSalidaTrama205($reglasNegocio)