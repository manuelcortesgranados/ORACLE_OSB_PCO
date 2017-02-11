(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama201/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:calcularSaldoCuentas($cuentasOCS as xs:string, $wS_Result as element(ns1:WS_Result), $tipoCuenta as xs:string) as xs:integer{
	let $cuentasSplit1 := fn:tokenize($cuentasOCS, "\|")
	let $cuentasSplit2 := concat(for $cuentaDA in $cuentasSplit1 
		return if(contains($cuentaDA, $tipoCuenta)) then concat(data(fn:tokenize($cuentaDA,";")[2]),";") else ())
	let $cuentasSplit := fn:tokenize($cuentasSplit2, ";")
	return xs:integer(fn:sum(for $i in $cuentasSplit return
		if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/Balance)!= "") 
			then number($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/Balance)
		else
			0))
};

declare function xf:calcularFechaMayor($cuentasOCS as xs:string, $wS_Result as element(ns1:WS_Result), $tipoCuenta as xs:string) as xs:dateTime{
	let $cuentasSplit1 := fn:tokenize($cuentasOCS, "\|")
	let $cuentasSplit2 := concat(for $cuentaDA in $cuentasSplit1 
		return if(contains($cuentaDA, $tipoCuenta)) then concat(data(fn:tokenize($cuentaDA,";")[2]),";") else ())
	let $cuentasSplit := fn:tokenize($cuentasSplit2, ";")	
	return max(for $i in $cuentasSplit return
		if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "" and data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "99991231T12:00:00+0000") 
			then fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate))
		else
			fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS","19700101T23:59:59+0000"))	
																				
};

declare function xf:adaptarParametrosSalidaTrama201($wS_Result as element(ns1:WS_Result), $cuentasDA as xs:string)
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
        fn:concat(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_CONTRATO/PROVIDER),
        		  ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_CONTRATO/TARIFF),
        		  ";",
        		  data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_CONTRATO/CONTRATO),
        		   ";",
        		  if(fn:contains(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST), "FNF")) then "TRUE" else "FALSE", (: IsFnFPossible :)
        		   ";",        		           		   		
        		  $FNFNumbers[1],   (:FnF_Numbers/*:Detail[1]:)
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
        		  $FNFNumbers[9], (:FnF_Numbers/*:Detail[9]:)
        		   ";",
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:RefillBarredUntil) != "") then "TRUE" else "FALSE", (: fraudLocked:)
        		   ";",
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:ContractStatus) = 3) then "TRUE" else "FALSE",  (: IsLocked :)
        		   ";",
        		  if(fn:contains(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST), "ILIMITADO")) then "TRUE" else "FALSE",  (: IsBestFnFPossible :)
        		   ";",
        		  $BESTFNFNumbers[1], (: BestFnF_Numbers/*:Detail[1] :)
        		   ";",
        		   (:ONPEAK ACCOUNT:)
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue)!= "") then
        		  	data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue)
        		  else
        		  	"0",
        		   ";",        		   
        		  if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate) != "") then
        		  	xf:expiryDateFormatter(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate))
        		  else 
        		  	"1970-01-01 23:59:59",
        		   ";",
        		   (:OFFPEAK ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result, "OFFPEAK"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result, "OFFPEAK"))," 23:59:59"),
        		   ";",
        		   (:FREESMS ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result, "FREESMS"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result, "FREESMS"))," 23:59:59"),
        		   ";",
        		   (:BONUS ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result, "BONUS"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result, "BONUS"))," 23:59:59"),
        		   ";",
        		   (:MINUTES2 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result, "MINUTES2"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result, "MINUTES2"))," 23:59:59"),
        		   ";",
        		   (:MINUTES3 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result, "MINUTES3"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result, "MINUTES3"))," 23:59:59"),
        		   ";",
        		   (:MINUTES4 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result, "MINUTES4"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result, "MINUTES4"))," 23:59:59"),
        		   ";",
        		   (:MONETARY2 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result, "MONETARY2"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result, "MONETARY2"))," 23:59:59"),
        		   ";",
        		   (: MonetaryAccountID3 :)        		   
				   "0",
				   ";",
				   "1970-01-01 23:59:59"         		   
        		 )
    		  
};

declare variable $wS_Result as element(ns1:WS_Result) external;
declare variable $cuentasDA as xs:string external;

xf:adaptarParametrosSalidaTrama201($wS_Result, $cuentasDA)