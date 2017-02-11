xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$reglasNegocio" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$ejecutador" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama200/";
declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:calcularSaldoCuentas($cuentasOCS as xs:string, $wS_Result as element(ns2:WS_Result), $tipoCuenta as xs:string) as xs:integer{
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

declare function xf:calcularFechaMayor($cuentasOCS as xs:string, $wS_Result as element(ns2:WS_Result), $tipoCuenta as xs:string) as xs:dateTime{
	let $cuentasSplit1 := fn:tokenize($cuentasOCS, "\|")
	let $cuentasSplit2 := concat(for $cuentaDA in $cuentasSplit1 
		return if(contains($cuentaDA, $tipoCuenta)) then concat(data(fn:tokenize($cuentaDA,";")[2]),";") else ())
	let $cuentasSplit := fn:tokenize($cuentasSplit2, ";")	
	return max(for $i in fn:tokenize($cuentasOCS, ";") return
		if(data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "" and data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "99991231T12:00:00+0000") 
			then fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", data($wS_Result/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name=$i]/ExpiryDate))
		else
			fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS","19700101T23:59:59+0000"))	
																				
};

declare function xf:adaptarParametrosSalidaTrama200($reglasNegocio as element(ns2:WS_Result),
    $ejecutador as element(ns0:WS_Result), $cuentasDA)
    as xs:string {
    	let $cobro  := exists($ejecutador/MENSAJE/SERVICIOS_EJECUTADOS/SERVICIO[NOMBRE="ITEL/OCS/AIR/Proxies/actualizarBalanceFechaOCSLocal_PS"])
    	let $servicio  := if ($cobro) then $ejecutador/MENSAJE/SERVICIOS_EJECUTADOS/SERVICIO[NOMBRE="ITEL/OCS/AIR/Proxies/actualizarBalanceFechaOCSLocal_PS"] else ()
    	let $balanceOnPeak := if( $cobro and data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ID_CUENTA_DEDICADA1"]/VALOR) = "0" ) then (xs:integer($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue) + xs:integer($servicio/PARAMETROS/PARAMETRO[NOMBRE="VALOR_RELATIVO1"]/VALOR)) else data($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/accountValue)
        let $balanceBonus := if( $cobro) then 
        						if(data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ID_CUENTA_DEDICADA1"]/VALOR) = "7000") then
        							(xs:integer($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='7000']/Balance) + xs:integer($servicio/PARAMETROS/PARAMETRO[NOMBRE="VALOR_RELATIVO1"]/VALOR))
        						else if(data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ID_CUENTA_DEDICADA2"]/VALOR) = "7000") then
        							(xs:integer($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='7000']/Balance) + xs:integer($servicio/PARAMETROS/PARAMETRO[NOMBRE="VALOR_RELATIVO2"]/VALOR))
        						else if(data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ID_CUENTA_DEDICADA3"]/VALOR) = "7000") then
        							(xs:integer($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='7000']/Balance) + xs:integer($servicio/PARAMETROS/PARAMETRO[NOMBRE="VALOR_RELATIVO3"]/VALOR))
        						else data($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='7000']/Balance)
        					  else data($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='7000']/Balance)		
       
        let $balanceMonetaria := if( $cobro) then 
	        						if(data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ID_CUENTA_DEDICADA1"]/VALOR) = "10422") then
	        							(xs:integer($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='10422']/Balance) + xs:integer($servicio/PARAMETROS/PARAMETRO[NOMBRE="VALOR_RELATIVO1"]/VALOR))
	        						else if(data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ID_CUENTA_DEDICADA2"]/VALOR) = "10422") then
	        							(xs:integer($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='10422']/Balance) + xs:integer($servicio/PARAMETROS/PARAMETRO[NOMBRE="VALOR_RELATIVO2"]/VALOR))
	        						else if(data($servicio/PARAMETROS/PARAMETRO[NOMBRE="ID_CUENTA_DEDICADA3"]/VALOR) = "10422") then
	        							(xs:integer($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='10422']/Balance) + xs:integer($servicio/PARAMETROS/PARAMETRO[NOMBRE="VALOR_RELATIVO3"]/VALOR))
	        						else data($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='10422']/Balance)
	        					  else data($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name='10422']/Balance)
        let $consultas := if( data($reglasNegocio/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='TIPOCONSULTA']/VALOR) = "1" ) then xs:integer(data($reglasNegocio/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='CONSULTASREALIZADAS']/VALOR)) + 1 else xs:integer(data($reglasNegocio/MENSAJE/PARAMETROS_REGLAS/PARAMETRO[NOMBRE='CONSULTASREALIZADAS']/VALOR))
        return 
        fn:concat($consultas,
        		  ";",
        		  "0",
        		  ";",        		  
        		  if(string($balanceOnPeak)!= "") then
        		  	$balanceOnPeak
        		  else
        		  	"0",
        		  ";",
        		  if(data($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate) != "") then
        		  	xf:expiryDateFormatter(data($reglasNegocio/MENSAJE/SUSCRIPTOR_OCS/BALANCES/expiryDate))
        		  else 
        		  	"1970-01-01 23:59:59",
        		  ";",
        		  (:OFFPEAK ACCOUNT:)
        		  xf:calcularSaldoCuentas($cuentasDA, $reglasNegocio, "OFFPEAK"),
        		   ";",
        		  concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $reglasNegocio, "OFFPEAK")), " 23:59:59"),
        		   ";",
        		   (:FREESMS ACCOUNT:)
        		  xf:calcularSaldoCuentas($cuentasDA, $reglasNegocio, "FREESMS"),
        		   ";",
        		  concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $reglasNegocio, "FREESMS")), " 23:59:59"),
        		   ";",
        		   (:BONUS ACCOUNT:)
        		  if(string($balanceBonus) != "") then
        		  	xs:integer(number($balanceBonus) + number(xf:calcularSaldoCuentas(replace($cuentasDA,'7000;',';'), $reglasNegocio, "BONUS")))
        		  else 
        		  	xf:calcularSaldoCuentas($cuentasDA, $reglasNegocio, "BONUS"),
        		   ";",
        		  concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $reglasNegocio, "BONUS")), " 23:59:59"),
        		   ";",
        		   (:MINUTES2 ACCOUNT:)
        		  xf:calcularSaldoCuentas($cuentasDA, $reglasNegocio, "MINUTES2"),
        		   ";",
        		  concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $reglasNegocio, "MINUTES2")), " 23:59:59"),
        		   ";",
        		   (:MINUTES3 ACCOUNT:)
        		  xf:calcularSaldoCuentas($cuentasDA, $reglasNegocio, "MINUTES3"),
        		   ";",
        		  concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $reglasNegocio, "MINUTES3")), " 23:59:59"),
        		   ";",
        		   (:MINUTES4 ACCOUNT:)
        		  xf:calcularSaldoCuentas($cuentasDA, $reglasNegocio, "MINUTES4"),
        		   ";",
        		  concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $reglasNegocio, "MINUTES4")), " 23:59:59"),
        		   ";",
        		   (:MONETARY2 ACCOUNT:)
        		  if(string($balanceMonetaria)!= "") then
        		  	$balanceMonetaria
        		  else 
        		  	xf:calcularSaldoCuentas($cuentasDA, $reglasNegocio, "MONETARY2"),
        		   ";",
        		  concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd",xf:calcularFechaMayor($cuentasDA, $reglasNegocio, "MONETARY2")), " 23:59:59"),
        		   ";",
        		  "0", (: MonetaryAccountID3 :)
        		   ";",
        		  "1970-01-01 23:59:59" (: MonetaryAccountID3 :)
        		  )
};

declare variable $reglasNegocio as element(ns2:WS_Result) external;
declare variable $ejecutador as element(ns0:WS_Result) external;
declare variable $cuentasDA as xs:string external;


xf:adaptarParametrosSalidaTrama200($reglasNegocio,
    $ejecutador, $cuentasDA)