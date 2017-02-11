(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama203OCS/";

declare function xf:adaptarParametrosSalidaTrama203OCS($wS_Result as element(ns1:WS_Result))
    as xs:string {
    	let $FNFNumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "FNF")
    					return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return $FnFNumber
    	let $BESTFNFNumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "ILIMITADO")
    					return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return $FnFNumber
    	return
    	fn:concat($BESTFNFNumbers[1],
        		  ";",
        		  $FNFNumbers[1],
        		   ";",
        		  $FNFNumbers[2],
        		   ";",
        		  $FNFNumbers[3],
        		   ";",
        		  $FNFNumbers[4],
        		   ";",
        		  $FNFNumbers[5],
        		   ";",
        		  $FNFNumbers[6],
        		   ";",
        		  $FNFNumbers[7],
        		   ";",
        		  $FNFNumbers[8],
        		   ";",
        		  $FNFNumbers[9],
        		   ";",
        		  if($BESTFNFNumbers[1] != "") then "1" else "0"
        		  )
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama203OCS($wS_Result)