xquery version "1.0" encoding "Cp1252";

declare namespace xf = "http://tempuri.org/ITEL/SM/Resources/XQueries/requestSM/";

declare function xf:requestSM1($requestSM as xs:string, $operacion as xs:string)
    as xs:string {
    
    let $cabecera := if (contains($operacion, "products/retrieve") ) then
			    		"RetrieveProductRequest"
			    	else if (contains($operacion, "subscriptions/retrieve")) then
			    		"RetrieveSubscriptionRequest"
			    	else if (contains($operacion, "groups/retrieve")) then
			    		"RetrieveProductGroupRequest"
			    	else if (contains($operacion, "subscriptions/add")) then
			    		"AddSubscriptionRequest"
			    	else if (contains($operacion, "subscriber/add")) then
			    		"AddSubscriberRequest"
			    	else if (contains($operacion, "subscriber/update")) then
			    		"UpdateSubscriberRequest"
			    	else
			    		"OperacionNoValida"
         
	let $peticion :='{
	  "CABECERA": {
	    "authentication": {
	      "user": "ITEL",
	      "password": "Itel$587",
	      "sourceApplicationId": "ITEL",
	      "transactionId": "1"
	    },
	    BODY
	  }
	}'	
	
	let $request := fn:replace($peticion, 'CABECERA', $cabecera)         
	
    return fn:replace($request, 'BODY', $requestSM)         
         
};

declare variable $operacion as xs:string external;
declare variable $requestSM as xs:string external;

xf:requestSM1($requestSM, $operacion)