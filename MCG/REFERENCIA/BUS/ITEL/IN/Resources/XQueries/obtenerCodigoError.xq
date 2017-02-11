declare namespace xf1 = "http://tempuri.org/ITEL/IN/Resources/XQueries/obtenerCodigoError/";

declare function xf1:obtenerCodigoError($mensaje as xs:string)
    as xs:string {
    	if (contains($mensaje, "CustomerNotFound")) then
    		"900"
    	else if (contains($mensaje, "Timeout de")) then
    		"10"
    	else if (contains($mensaje, "Pool no inicializado")) then
    		"914"
    	else if (contains($mensaje, "Timeout waiting for idle object") or contains($mensaje, "Pool exhausted")) then 
    		"907"
    	else if (contains($mensaje, "Timeout recuperando")) then
    		"15"
    	else if (contains($mensaje, "password has to be changed")) then
			"9"
		else if (contains($mensaje, "Traffic Limit Violation")) then
			"8"
		else if (contains($mensaje, "Invalid number of fields")) then
			"13"
		else if (contains($mensaje, "Group limit is going to be reached")) then
			"16"	
    	else
    		"901"
};

declare variable $mensaje as xs:string external;

xf1:obtenerCodigoError($mensaje)