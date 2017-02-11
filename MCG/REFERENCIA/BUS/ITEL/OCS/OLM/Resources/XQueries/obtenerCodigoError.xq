declare namespace xf1 = "http://tempuri.org/ITEL/OCS/Resources/XQueries/obtenerCodigoError/";

declare function xf1:obtenerCodigoError($codigoOCS as xs:string, $codigoDESC as xs:string)
    as xs:string {    		
    	if  (contains($codigoDESC, "21040.") or contains($codigoDESC, "20000.")) then
    		"900"    	    	
    	else if (contains($codigoDESC, "124.AIR")) then
    		"28"	
		else if (contains($codigoDESC, "126.AIR")) then
			"22"		
		else if (contains($codigoDESC, "104.AIR")) then
			"902"
		else if ($codigoOCS = "11006") then
    		"923"	
    	else if (contains($codigoDESC, "26029.")) then
    		"31"
    	else if ($codigoOCS = "11005") then
    		"32"
    	else if (contains($codigoDESC,"129.AIR")) then
    		"27"
    	else if (contains($codigoDESC,"136.AIR")) then
    		"25"
    	else if (contains($codigoDESC,"165.AIR")) then
    		"26"
    	else if (contains($codigoDESC,"21047.")) then
    		"35"
    	else if (contains($codigoDESC,"21110.")) then
    		"36"
    	else if (contains($codigoDESC,"21126.")) then
    		"37"    
    	else if (contains($codigoDESC, "26036.")) then
    		"34"
    	else if (contains($codigoDESC, "26042.")) then
    		"38"	
    	else if (contains($codigoDESC,"26043.")) then
    		"29"
    	else if (contains($codigoDESC,"26044.")) then
    		"39"
    	else if (contains($codigoDESC,"26058.")) then	
    		"42"
    	else if (contains($codigoDESC,"26052.")) then	
    		"43"
    	else if (contains($codigoDESC, "130.AIR")) then
			"44"
		else if (contains($codigoDESC, "206.AIR")) then
			"45"
    	else if (contains($codigoDESC,"26018.")) then	
    		"46"
    	else if ($codigoOCS = "11036") then	
    		"47"
    	else if (contains($codigoDESC, "167.AIR")) then
			"48"
    	else if (contains($codigoDESC,"21052.")) then	
    		"49"    	
    	else
    		"30"
};


declare variable $codigoOCS as xs:string external;
declare variable $codigoDESC as xs:string external;

xf1:obtenerCodigoError($codigoOCS, $codigoDESC)