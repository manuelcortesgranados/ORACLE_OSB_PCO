xquery version "1.0" encoding "Cp1252";

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/JSONtoItel_Res/";

declare function xf:JSONtoItel_Res($codigo as xs:string)
    as xs:string {
	let $quote := "&#34;" 
	return
        concat("{",
			$quote, "AddSubscriptionResponse",$quote," : {",
			$quote, "resultCode",$quote," : {",
			xf:codigoError($codigo ),
			$quote, "subscriptionId", $quote, " : ", $quote, "1234567890123456", $quote, "}}"
		)
	};

declare function xf:codigoError($codigo as xs:string) as xs:string{	
	let $quote := "&#34;"
	return
	if ($codigo='1') then
			concat ($quote, "resultCode",$quote," : ", $quote, "0", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "SUCCESS", $quote,"},") 
	else 	if ($codigo='900') then
			concat ($quote, "resultCode",$quote," : ", $quote, "1110", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "The subscriber does not exist", $quote,"},") 
	else 	if ($codigo='919') then
			concat ($quote, "resultCode",$quote," : ", $quote, "9000", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "Not enough balance", $quote,"},") 	
	else 	if ($codigo='944') then
			concat ($quote, "resultCode",$quote," : ", $quote, "9001", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "Expired account", $quote,"},") 						
	else 	if ($codigo='20') then
			concat ($quote, "resultCode",$quote," : ", $quote, "201", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "Input parameter msisdn error", $quote,"},") 			
	else 	if ($codigo='21') then
			concat ($quote, "resultCode",$quote," : ", $quote, "212", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "Input parameter productId cannot be null", $quote,"},") 			
	else 	if ($codigo='22') then
			concat ($quote, "resultCode",$quote," : ", $quote, "1201", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "The product does not exist", $quote,"},") 	
	else 
			concat ($quote, "resultCode",$quote," : ", $quote, "1001", $quote,",",
			$quote, "resultDescription",$quote," : ", $quote, "Internal server error", $quote,"},") 
};

declare variable $codigo as xs:string external;

xf:JSONtoItel_Res($codigo)
