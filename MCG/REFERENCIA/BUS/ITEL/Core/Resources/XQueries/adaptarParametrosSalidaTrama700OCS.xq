xquery version "1.0" encoding "Cp1252";
(:: pragma bea:local-element-parameter parameter="$suscriptor" type="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidasTrama700OCS/";
declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";

declare function xf:adaptarParametrosSalidasTrama700OCS($suscriptor as element(ns1:WS_Result))
    as xs:string {
    	let $SMSFNFOnNetNumbers:= for $FNFList in $suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "SMS ONNET")
    					return $FNFList/DetailNumber/fafNumber
    	let $SMSFNFOnNetExpiryDate:= for $FNFList in $suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "SMS ONNET")
    					return concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $FNFList/expiryDate))," 23:59:59")
    	let $SMSFNFOffNetNumbers:= for $FNFList in $suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "SMS OFFNET")
    					return $FNFList/DetailNumber/fafNumber
    	let $SMSFNFOffNetExpiryDate:= for $FNFList in $suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "SMS OFFNET")
    					return concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $FNFList/expiryDate))," 23:59:59")
    	let $SMSFNFAnyNumbers:= for $FNFList in $suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "SMS ANY")
    					return $FNFList/DetailNumber/fafNumber
    	let $SMSFNFAnyExpiryDate:= for $FNFList in $suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "SMS ANY")
    					return concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $FNFList/expiryDate))," 23:59:59")
    	return
        fn:concat(
    				 "smsFnFOnNet"
    				,";"
    				, fn:substring($SMSFNFOnNetNumbers[1],4)
    				,";"
    				, fn:substring($SMSFNFOnNetNumbers[2],4)
    				,";"
    				, fn:substring($SMSFNFOnNetNumbers[3],4)
    				,";"
    				, fn:substring($SMSFNFOnNetNumbers[4],4)
    				,";"
    				, fn:substring($SMSFNFOnNetNumbers[5],4)
    				,";" 
					, if(fn:contains($suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST,"SMS ONNET")) then $SMSFNFOnNetExpiryDate else () 
					,";"
					, "smsFnFOffNet"
					,";"
					, fn:substring($SMSFNFOffNetNumbers[1],4)
					,";"
    				, fn:substring($SMSFNFOffNetNumbers[2],4)
    				,";"
    				, fn:substring($SMSFNFOffNetNumbers[3],4)
    				,";"
    				, fn:substring($SMSFNFOffNetNumbers[4],4)
    				,";"
    				, fn:substring($SMSFNFOffNetNumbers[5],4)
    				,";"
					, if(fn:contains($suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST,"SMS OFFNET")) then $SMSFNFOffNetExpiryDate else ()
					,";"
					, "smsFnFAny"
					,";"
					, fn:substring($SMSFNFAnyNumbers[1],4)
					,";"
    				, fn:substring($SMSFNFAnyNumbers[2],4)
    				,";"
    				, fn:substring($SMSFNFAnyNumbers[3],4)
    				,";"
    				, fn:substring($SMSFNFAnyNumbers[4],4)
    				,";"
    				, fn:substring($SMSFNFAnyNumbers[5],4)
    				,";"
					, if(fn:contains($suscriptor/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST,"SMS ANY")) then $SMSFNFAnyExpiryDate else ()
    			)
    				
};

declare variable $suscriptor as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidasTrama700OCS($suscriptor)