(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama204OCS/";

declare function xf:dateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:adaptarParametrosSalidaTrama204($wS_Result as element(ns1:WS_Result))
    as xs:string {
    	let $FNFNumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "FNF")
    					return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return $FnFNumber
    	let $BESTFNFNumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "ILIMITADO")
    					return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return $FnFNumber
    	let $FAOnNET:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "ONNET")
    					return $FNFList/DetailNumber/fafNumber
    	let $FAOffNET:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "OFFNET")
    					return $FNFList/DetailNumber/fafNumber
    	let $FAAnyNET:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "ANYNET")
    					return $FNFList/DetailNumber/fafNumber								
    					
    	let $expiryDateFNF:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "FNF")
    					return $FNFList/expiryDate			
    	let $expiryDateBESTFNF:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "ILIMITADO")
    				   return $FNFList/expiryDate
    	let $expiryDateFA:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "SMS")
    					return $FNFList/expiryDate	    					
    								
    	return
    	concat(fn:string-join( (
    	          concat(data("BestFnF"),""),
    			  concat($BESTFNFNumbers[1],""),
    			  concat($BESTFNFNumbers[2],""),
    			  concat($BESTFNFNumbers[3],""),
    			  concat($BESTFNFNumbers[4],""),
    			  concat($BESTFNFNumbers[5],""),
    			  concat($BESTFNFNumbers[6],""),
    			  concat($BESTFNFNumbers[7],""),
    			  concat($BESTFNFNumbers[8],""),
    			  concat($BESTFNFNumbers[9],""),
    			  concat(if ($BESTFNFNumbers[1]!='')then xf:dateFormatter($expiryDateBESTFNF)else (),""),
    			  concat(data("FnF"),""),
        		  concat($FNFNumbers[1],""),
        		  concat($FNFNumbers[2],""),
        		  concat($FNFNumbers[3],""),
        		  concat($FNFNumbers[4],""),
        		  concat($FNFNumbers[5],""),
        		  concat($FNFNumbers[6],""),
        		  concat($FNFNumbers[7],""),
        		  concat($FNFNumbers[8],""),
        		  concat($FNFNumbers[9],""),
        		  (: concat("",""), :)
        		  concat(if ($FNFNumbers[1]!='')then xf:dateFormatter($expiryDateFNF) else(),""))
        		  ,";")
        		  ,
        		  ";SMSOnNet"
    				,";"
    				, data(fn:substring($FAOnNET[1],4) )
    				,";"
    				, data(fn:substring($FAOnNET[2],4) )
    				,";"
    				, data(fn:substring($FAOnNET[3],4) )
    				,";"
    				, data(fn:substring($FAOnNET[4],4) )
    				,";"
    				, data(fn:substring($FAOnNET[5],4) )
    				,";" 
					, data(if ($FAOnNET[1]!='')then xf:dateFormatter($expiryDateFA) else())
					,";"
					, "SMSOffNet"
					,";"
					, data(fn:substring($FAOffNET[1],4))
					,";"
    				, data(fn:substring($FAOffNET[2],4))
    				,";"
    				, data(fn:substring($FAOffNET[3],4))
    				,";"
    				, data(fn:substring($FAOffNET[4],4))
    				,";"
    				, data(fn:substring($FAOffNET[5],4))
    				,";"
					, data(if ($FAOffNET[1]!='')then xf:dateFormatter($expiryDateFA) else())
					,";"
					, "SMSAny"
					,";"
					, data(fn:substring($FAAnyNET[1],4))
					,";"
    				, data(fn:substring($FAAnyNET[2],4))
    				,";"
    				, data(fn:substring($FAAnyNET[3],4))
    				,";"
    				, data(fn:substring($FAAnyNET[4],4))
    				,";"
    				, data(fn:substring($FAAnyNET[5],4))
    				,";"
					, data(if ($FAAnyNET[1]!='')then xf:dateFormatter($expiryDateFA) else())
        		  )        		  
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama204($wS_Result)