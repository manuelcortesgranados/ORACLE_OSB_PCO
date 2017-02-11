(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_CONSULTAR_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/SubscriptionRetrieveSM/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/consultarPaqueteDatosSM_Req/";

declare function xf:consultarPaqueteDatosSM_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as xs:string {
    	let $quote := "&#34;"  
    	return
        concat("{",
			$quote, "RetrieveSubscriptionRequest",$quote," : {",
			$quote, "authentication",$quote," : {",
			$quote, "user",$quote," : ", $quote, data($input_Parameters1/user), $quote,",",
			$quote, "password",$quote," : ", $quote, data($input_Parameters1/password), $quote,",",
			$quote, "sourceApplicationId", $quote, " : ", $quote, data($input_Parameters1/user), $quote, ",",
			$quote, "transactionId", $quote, " : ", $quote, "1", $quote, "},",
			$quote, "subscriberIdentifier", $quote, " : {", 
			$quote, "identifierType", $quote, ":", $quote, "0", $quote,",", 
			$quote, "identifierValue", $quote, " : ", $quote, data($input_Parameters1/msisdn), $quote, "},",
			$quote, "target", $quote, " : ", $quote, "INDIVIDUAL", $quote, ",",
			$quote, "findBy", $quote, " : ", $quote, "SUBSCRIBER", $quote, ",",
			$quote, "filter", $quote, " : ", $quote, "status", $quote, ",",
			$quote, "parameter", $quote," :  [{", 
			$quote, "name", $quote," : ", $quote, "status", $quote, ",",
			$quote, "value", $quote, " : ", $quote, "3", $quote, "}]}}"
		)
	};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarPaqueteDatosSM_Req($input_Parameters1)
