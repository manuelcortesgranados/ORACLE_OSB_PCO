(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns3:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$reglasNegocio" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$ejecutador" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama407OCS/";
declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns3 = "http://www.comcel.com.co/ConsultarBalancesOCS/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:calcularSaldoCuentas($cuentasOCS as xs:string, $wS_Result as element(ns3:WS_Result), $tipoCuenta as xs:string) as xs:integer{
	let $cuentasSplit1 := fn:tokenize($cuentasOCS, "\|")
	let $cuentasSplit2 := concat(for $cuentaDA in $cuentasSplit1 
		return if(contains($cuentaDA, $tipoCuenta)) then concat(data(fn:tokenize($cuentaDA,";")[2]),";") else ())
	let $cuentasSplit := fn:tokenize($cuentasSplit2, ";")
	return xs:integer(fn:sum(for $i in $cuentasSplit return
		if(data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/Balance)!= "") 
			then number($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/Balance)
		else
			0))
};

declare function xf:calcularFechaMayor($cuentasOCS as xs:string, $wS_Result as element(ns3:WS_Result), $tipoCuenta as xs:string) as xs:dateTime{
	let $cuentasSplit1 := fn:tokenize($cuentasOCS, "\|")
	let $cuentasSplit2 := concat(for $cuentaDA in $cuentasSplit1 
		return if(contains($cuentaDA, $tipoCuenta)) then concat(data(fn:tokenize($cuentaDA,";")[2]),";") else ())
	let $cuentasSplit := fn:tokenize($cuentasSplit2, ";")	
	return max(for $i in fn:tokenize($cuentasOCS, ";") return
		if(data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "" and data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "99991231T12:00:00+0000") 
			then fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/ExpiryDate))
		else
			fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS","19700101T23:59:59+0000"))	
																				
};


declare function xf:adaptarParametrosSalidaTrama407OCS($reglasNegocio as element(ns2:WS_Result),
    $ejecutador as element(ns0:WS_Result),
    $wS_Result1 as element(ns3:WS_Result),
    $contrato as xs:string, 
    $cuentasDA as xs:string)
    as xs:string {
    let $onPeakAccountID          := data($wS_Result1/MENSAJE/CONSULTAR_BALANCES/*:MethodResponse/*:accountValue)
        let $onPeakAccountExpiryDate  := data($wS_Result1/MENSAJE/CONSULTAR_BALANCES/*:MethodResponse/*:expiryDate)
        
        return        	
        	concat(
	           (: OnPeakAccountID :)
	           xs:integer($onPeakAccountID)
	        	, ";"
	        	, if ($onPeakAccountExpiryDate != "") then xf:expiryDateFormatter($onPeakAccountExpiryDate) else "1970-01-01 23:59:59"
	        	, ";",        	
	           (:OFFPEAK ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result1, "OFFPEAK"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result1, "OFFPEAK"))," 23:59:59"),
        		   ";",
        		   (:FREESMS ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result1, "FREESMS"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result1, "FREESMS"))," 23:59:59"),
        		   ";",
        		   (:BONUS ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result1, "BONUS"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result1, "BONUS"))," 23:59:59"),
        		   ";",
        		   (:MINUTES2 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result1, "MINUTES2"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result1, "MINUTES2"))," 23:59:59"),
        		   ";",
        		   (:MINUTES3 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result1, "MINUTES3"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result1, "MINUTES3"))," 23:59:59"),
        		   ";",
        		   (:MINUTES4 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result1, "MINUTES4"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result1, "MINUTES4"))," 23:59:59"),
        		   ";",
        		   (:MONETARY2 ACCOUNT:)
        		   xf:calcularSaldoCuentas($cuentasDA, $wS_Result1, "MONETARY2"),
        		   ";",
        		   concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $wS_Result1, "MONETARY2"))," 23:59:59"),
			   ";",
			   (: MonetaryAccountID3 :)        		   
			   "0",
			   ";",
			   "1970-01-01 23:59:59"
        	)
};

declare variable $reglasNegocio as element(ns2:WS_Result) external;
declare variable $ejecutador as element(ns0:WS_Result) external;
declare variable $wS_Result1 as element(ns3:WS_Result) external;
declare variable $contrato as xs:string external;
declare variable $cuentasDA as xs:string external;

xf:adaptarParametrosSalidaTrama407OCS($reglasNegocio,
    $ejecutador,
    $wS_Result1,
    $contrato, $cuentasDA)