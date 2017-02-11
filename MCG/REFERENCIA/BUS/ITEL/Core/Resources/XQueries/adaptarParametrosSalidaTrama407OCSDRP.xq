(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns3:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$reglasNegocio" element="ns2:WS_Result" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$ejecutador" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/adaptarParametrosSalidaTrama407OCSDRP/";
declare namespace ns2 = "http://www.comcel.com.co/EjecutarReglasNegocio/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns3 = "http://www.comcel.com.co/ConsultarBalancesOCS/";

declare function xf:expiryDateFormatter($expiryDate as xs:string) as xs:string{	
	concat(fn-bea:dateTime-to-string-with-format("yyyy-MM-dd", fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $expiryDate)), " 23:59:59")
};

declare function xf:calcularSaldoCuentas($cuentasOCS as xs:string, $wS_Result as element(ns3:WS_Result)) as xs:integer{
	let $cuentasSplit := fn:tokenize($cuentasOCS, ";")
	return xs:integer(fn:sum(for $i in $cuentasSplit return
		if(data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/Balance)!= "") 
			then number($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/Balance)
		else
			0))
};

declare function xf:calcularFechaMayor($cuentasOCS as xs:string, $wS_Result as element(ns3:WS_Result)) as xs:dateTime{	
	 max(for $i in fn:tokenize($cuentasOCS, ";") return
		if(data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "" and data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/ExpiryDate)!= "99991231T12:00:00+0000") 
			then fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", data($wS_Result/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail[Name=$i]/ExpiryDate))
		else
			fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS","19700101T23:59:59+0000"))	
																				
};


declare function xf:adaptarParametrosSalidaTrama407OCSDRP($contrato as xs:string)
    as xs:string {
        let $contrac          := data($contrato)        
        return        	
        	concat(
	           (: OnPeakAccountID :)
	           "0"
	        	, ";"
	        	, "1970-01-01 23:59:59"
	        	, ";",        	
	           (:OFFPEAK ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:FREESMS ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:BONUS ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:MINUTES2 ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:MINUTES3 ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:MINUTES4 ACCOUNT:)
			   "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (:MONETARY2 ACCOUNT:)
			  "0",
			   ";",
			   "1970-01-01 23:59:59",
			   ";",
			   (: MonetaryAccountID3 :)        		   
			   "0",
			   ";",
			   "1970-01-01 23:59:59"
        	)
};

declare variable $contrato as xs:string external;

xf:adaptarParametrosSalidaTrama407OCSDRP($contrato)