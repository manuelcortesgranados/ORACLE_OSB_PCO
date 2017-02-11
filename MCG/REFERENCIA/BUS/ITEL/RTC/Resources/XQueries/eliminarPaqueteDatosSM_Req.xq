(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ELIMINAR_PAQUETE_DATOS_SM.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EliminarPaqueteSM/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/eliminarPaqueteDatosSM_Req/";

declare function xf:eliminarPaqueteDatosSM_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as xs:string {
    	let $quote := "&#34;"  
    	return
        concat("{",
			$quote, "SMActionRequest",$quote," : {",
			$quote, "authentication",$quote," : {",
			$quote, "user",$quote," : ", $quote, data($input_Parameters1/user), $quote,",",
			$quote, "password",$quote," : ", $quote, data($input_Parameters1/password), $quote,",",
			$quote, "sourceApplicationId", $quote, " : ", $quote, data($input_Parameters1/user), $quote, ",",
			$quote, "transactionId", $quote, " : ", $quote, "1", $quote, "},",
			$quote, "action", $quote, " : ", $quote, "cancelSubscriptionForSubscriber", $quote, ",",
			$quote, "parameters", $quote," :  [{", 
			$quote, "name", $quote," : ", $quote, "subscriptionId", $quote, ",",
			$quote, "value", $quote, " : ", $quote, data($input_Parameters1/subscriptionId), $quote, "}]}}"
		)
	};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:eliminarPaqueteDatosSM_Req($input_Parameters1)
