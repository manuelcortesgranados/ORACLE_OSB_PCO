declare namespace xf1 = "http://tempuri.org/ITEL/OCS/Resources/XQueries/obtenerCodigoError/";

declare function xf1:obtenerCodigoError($codigoOCS as xs:string)
    as xs:string {
    	if ($codigoOCS = "102") then
    		"900"
    	else if ($codigoOCS = "103") then	(: Account barred from refill :)
    		"910"		
    	else if ($codigoOCS = "104") then	(: Temporary Bloqued :)
    		"902"	
    	else if ($codigoOCS = "106") then	(: Dedicated account negative :)
    		"919"
    	else if ($codigoOCS = "107" or $codigoOCS = "108" ) then	(: Voucher status used :)
    		"950"	
		else if ($codigoOCS = "110" ) then	(: Voucher status unavailable :)
    		"951"
    	else if ($codigoOCS = "109" ) then	(: Voucher status expired :)
    		"952"
    	else if ($codigoOCS = "111" ) then	(: Voucher status stolen or missing :)
    		"953"	
    	else if ($codigoOCS = "112" ) then	(: Voucher status damaged :)
    		"954"
    	else if ($codigoOCS = "113" ) then	(: Voucher status pending :)
    		"955"
    	else if ($codigoOCS = "114" ) then	(: Voucher type not accepted :)
    		"956"	
    	else if ($codigoOCS = "115") then	(: Refill not accepted :)
    		"960"
    	else if ($codigoOCS = "119") then	(: Invalid voucher activation code :)
    		"957"	
    	else if ($codigoOCS = "120") then	(: Invalid refill profile :)
    		"958"	
    	else if ($codigoOCS = "123") then	(: Max credit limit exceeded :)
    		"23"	
    	else if ($codigoOCS = "124") then	(: Below minimum balance :)
    		"919"
    	else if ($codigoOCS = "126" ) then	(: Account not active :)
    		"959"
    	else if ($codigoOCS = "136" ) then	(: Date Adjustment error :)
    		"56"
    	else if ($codigoOCS = "139" ) then	(: Dedicated account not defined :)
    		"22"
    	else if ($codigoOCS = "153") then	(: Dedicated account max credit limit exceeded :)
    		"24"
      	else if ($codigoOCS = "165") then	(: Offer not found :)
    		"57"
    	else if ($codigoOCS = "167") then	(: Invalid Unit Type :)
    		"59"		
    	else
    		"20"

};

declare variable $codigoOCS as xs:string external;

xf1:obtenerCodigoError($codigoOCS)