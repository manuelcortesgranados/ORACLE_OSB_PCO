(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_PROVISION_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/SuscriptionAddRequestSM/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionPaqueteDatosSM_Req/";

declare function xf:provisionPaqueteDatosSM_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as xs:string {
    	let $quote := "&#34;"  
    	return
        concat("{",
			$quote, "AddSubscriptionRequest",$quote," : {",
			$quote, "authentication",$quote," : {",
			$quote, "user",$quote," : ", $quote, data($input_Parameters1/user), $quote,",",
			$quote, "password",$quote," : ", $quote, data($input_Parameters1/password), $quote,",",
			$quote, "sourceApplicationId", $quote, " : ", $quote, data($input_Parameters1/user), $quote, ",",
			$quote, "transactionId", $quote, " : ", $quote, "1", $quote, "},",
			$quote, "subscriberIdentifier", $quote, " : {", 
			$quote, "identifierType", $quote, ":", $quote, "0", $quote,",", 
			$quote, "identifierValue", $quote, " : ", $quote, data($input_Parameters1/msisdn), $quote, "},",
			$quote, "productId", $quote, " : ", $quote, data($input_Parameters1/productid), $quote, ",",
			$quote, "scheduledFlag", $quote, " : ", $quote, "false", $quote, ",",
			$quote, "scheduledDate", $quote, " : ", $quote, "0", $quote, ",",
			$quote, "recurrentFlag", $quote," : ", $quote, "false", $quote,",",
			$quote, "recurrentCount", $quote, " : ", $quote, "0", $quote, ",",
			$quote, "parentSubscriptionId", $quote," : ", $quote, "0", $quote,",",
			$quote, "promotionCode", $quote, " : ", $quote, "", $quote, "}}"
		)
	};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:provisionPaqueteDatosSM_Req($input_Parameters1)
