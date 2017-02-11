declare namespace xf1 = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/obtenerCodigoError/";

declare function xf1:obtenerCodigoError($codigoOCS as xs:string)
    as xs:string {
    	if (contains($codigoOCS, "CustomerNotFound") or contains($codigoOCS, "Subscriber Not Found")) then
    		"900"
    	else if (contains($codigoOCS, "RC6137") or contains($codigoOCS, "No se puede asignar el recurso") or contains($codigoOCS, "Ya se ha instalado el abonado") or contains($codigoOCS, "SubscriberAlreadyInstalled")) then
    		"921"
    	else if(contains($codigoOCS, "Temporalmente bloqueada")) then
    		"902"
    	else if (contains($codigoOCS, "Timeout de")) then
    		"10"
    	else if (contains($codigoOCS, "Pool no inicializado")) then
    		"914"
    	else if (contains($codigoOCS, "Timeout waiting for idle object") or contains($codigoOCS, "Pool exhausted")) then 
    		"907"
    	else if (contains($codigoOCS, "Timeout recuperando")) then
    		"15"
    	else if (contains($codigoOCS, "password has to be changed")) then
			"9"
		else if (contains($codigoOCS, "Traffic Limit Violation")) then
			"8"
		else if (contains($codigoOCS, "Invalid number of fields")) then
			"13"
		else if (contains($codigoOCS, "Group limit is going to be reached")) then
			"16"	
		else if (contains($codigoOCS, "AIR.A136.DateAdjustmentError")) then
			"25"				
    	else
    		"40"
};

declare variable $codigoOCS as xs:string external;

xf1:obtenerCodigoError($codigoOCS)