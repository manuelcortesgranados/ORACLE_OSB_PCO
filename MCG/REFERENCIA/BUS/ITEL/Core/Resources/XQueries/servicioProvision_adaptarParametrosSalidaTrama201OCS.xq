(:: pragma bea:global-element-parameter parameter="$wS_Result" element="ns1:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama201/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:calcularSaldoCuentas($cuentasOCS as xs:string, $wS_Result as element(ns1:WS_Result)) as xs:integer{
	let $cuentasSplit := fn:tokenize($cuentasOCS, ";")
	return xs:integer(fn:sum(for $i in $cuentasSplit return
		if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/Balance)!= "") 
			then number($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/Balance)
		else
			0))
};

declare function xf:calcularFechaMayor($cuentasOCS as xs:string, $wS_Result as element(ns1:WS_Result)) as xs:dateTime{	
	 max(for $i in fn:tokenize($cuentasOCS, ";") return
		if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "" and data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "99991231T12:00:00+0000") 
			then fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate))
		else
			fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS","19700101T23:59:59+0000"))	
																				
};

declare function xf:adaptarParametrosSalidaTrama201($wS_Result as element(ns1:WS_Result))
    as xs:string {
    
    	let $FNFNumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "FNF")
    					return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return if (fn:starts-with($FnFNumber,'03')) then $FnFNumber else fn:substring($FnFNumber,4)
    	let $BESTFNFNumbers:= for $FNFList in $wS_Result/MENSAJE/SUSCRIPTOR_OCS/FAF_LIST/fafInformationList/Detail
    				where fn:contains($FNFList/fafIndicator, "ILIMITADO")
    					return for $FnFNumber in $FNFList/DetailNumber/fafNumber
    						 return if (fn:starts-with($FnFNumber,'03')) then $FnFNumber else fn:substring($FnFNumber,4)	   		
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
        		   xf:calcularSaldoCuentas("7003;10400;10401;10402;10403;7007;10404;10405;10406;10407;10408;10409", $wS_Result),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("7003;10400;10401;10402;10403;7007;10404;10405;10406;10407;10408;10409", $wS_Result))," 23:59:59"),
        		   ";",
        		   (:FREESMS ACCOUNT:)
        		   xf:calcularSaldoCuentas("20130;20131;20132;20133;20001;20002;20003;20004;20005;20006;20007;20008;20009;20010;20011;20012;20013;20014;20015;20027;20018;20019;20016;20017", $wS_Result),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("20130;20131;20132;20133;20001;20002;20003;20004;20005;20006;20007;20008;20009;20010;20011;20012;20013;20014;20015;20027;20018;20019;20016;20017", $wS_Result))," 23:59:59"),
        		   ";",
        		   (:BONUS ACCOUNT:)
        		   xf:calcularSaldoCuentas("7000;10350;10351;10353;10361;10500;7001;7002;10421;7004;7005;7006;7008;7109", $wS_Result),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("7000;10350;10351;10353;10361;10500;7001;7002;10421;7004;7005;7006;7008;7109", $wS_Result))," 23:59:59"),
        		   ";",
        		   (:MINUTES2 ACCOUNT:)
        		   xf:calcularSaldoCuentas("10370;10371;10372;10373;10374", $wS_Result),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10370;10371;10372;10373;10374", $wS_Result))," 23:59:59"),
        		   ";",
        		   (:MINUTES3 ACCOUNT:)
        		   xf:calcularSaldoCuentas("10380;10381;10382;10383;10384", $wS_Result),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10380;10381;10382;10383;10384", $wS_Result))," 23:59:59"),
        		   ";",
        		   (:MINUTES4 ACCOUNT:)
        		   xf:calcularSaldoCuentas("10390;10391;10392;10393;10394", $wS_Result),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10390;10391;10392;10393;10394", $wS_Result))," 23:59:59"),
        		   ";",
        		   (:MONETARY2 ACCOUNT:)
        		   xf:calcularSaldoCuentas("10422", $wS_Result),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor("10422", $wS_Result))," 23:59:59"),
        		   ";",
        		   (: MonetaryAccountID3 :)        		   
				   "0",
				   ";",
				   "1970-01-01 23:59:59"         		   
        		 )
    		  
};

declare variable $wS_Result as element(ns1:WS_Result) external;

xf:adaptarParametrosSalidaTrama201($wS_Result)