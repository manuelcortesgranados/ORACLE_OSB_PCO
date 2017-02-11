(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama202OCS/";

declare function xf:adaptarParametrosSalidaTrama202($wS_Result as element(ns1:WS_Result))
    as xs:string {
    	let $FNFNumbers   := for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "FNF")
    					return  
    						for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return $FnFNumber
    					
    	let $BESTFNFNumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains(data($FNFList/fafIndicator), "ILIMITADO")
    					return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return $FnFNumber
    					
    	let $FANumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains(data($FNFList/fafIndicator), "FA")
    					return $FNFList/DetailNumber/fafNumber
    	return
    	fn:string-join( (
    			  concat($BESTFNFNumbers[1],""),
    			  concat($BESTFNFNumbers[2],""),
    			  concat($BESTFNFNumbers[3],""),
    			  concat($BESTFNFNumbers[4],""),
    			  concat($BESTFNFNumbers[5],""),
    			  concat($BESTFNFNumbers[6],""),
    			  concat($BESTFNFNumbers[7],""),
    			  concat($BESTFNFNumbers[8],""),
    			  concat($BESTFNFNumbers[9],""),
        		  concat($FNFNumbers[1],""),
        		  concat($FNFNumbers[2],""),
        		  concat($FNFNumbers[3],""),
        		  concat($FNFNumbers[4],""),
        		  concat($FNFNumbers[5],""),
        		  concat($FNFNumbers[6],""),
        		  concat($FNFNumbers[7],""),
        		  concat($FNFNumbers[8],""),
        		  concat($FNFNumbers[9],""),
        		  concat((if(not(contains($wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST, "FA"))) then "" else "031"),fn:substring($FANumbers[1],5),"")
        		  )
        		  ,";")
        		  
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama202($wS_Result)