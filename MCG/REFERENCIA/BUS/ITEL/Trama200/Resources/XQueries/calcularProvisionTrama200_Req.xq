(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA200.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama200Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama200Provision/Trama200Provision_DF_Trama200Provision";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama200/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama200/Resources/XQueries/calcularProvisionTrama200_Req/";

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:getAccountExpiryDateOCS($input_Parameters1 as element(ns1:Input_Parameters), $accountID){
	if ( $accountID = 1 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/expiryDate) else
   	 if ( $accountID = 2 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7001"]/ExpiryDate) else
	  if ( $accountID = 3 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="2013"]/ExpiryDate) else
	   if ( $accountID = 4 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7000"]/ExpiryDate) else 
	    if ( $accountID = 5 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1035"]/ExpiryDate) else
	     if ( $accountID = 6 ) then () else
	      if ( $accountID = 7 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1037"]/ExpiryDate) else
	       if ( $accountID = 8 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1038"]/ExpiryDate) else
	        if ( $accountID = 9 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1039"]/ExpiryDate) 
	        else ()
};

declare function xf:getAccountBalanceOCS($input_Parameters1 as element(ns1:Input_Parameters), $accountID){
	if ( $accountID = 1 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/accountValue) else
   	 if ( $accountID = 2 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7001"]/Balance) else
	  if ( $accountID = 3 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="2013"]/Balance) else
	   if ( $accountID = 4 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7000"]/Balance) else 
	    if ( $accountID = 5 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1035"]/Balance) else
	     if ( $accountID = 6 ) then () else
	      if ( $accountID = 7 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1037"]/Balance) else
	       if ( $accountID = 8 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1038"]/Balance) else
	        if ( $accountID = 9 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1039"]/Balance) 
	        else ()
};

declare function xf:isExpiredOCS($fechaExpiracionActual as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaCUENTA := xs:dateTime(concat(substring($fechaExpiracionActual, 1, 4),"-",substring($fechaExpiracionActual, 5, 2),"-",substring($fechaExpiracionActual, 7, 2),"T00:00:00-05:00"))
    	let $diferencia := fn:days-from-duration($fechaCUENTA - $fechaActual)
    	return if ($diferencia >= 0) then xs:boolean("false") else xs:boolean("true") 
};

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns1:Input_Parameters))
	{
   let $balanceOnPeak := data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/accountValue)
   let $balanceBonus := data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7000"]/Balance)
   let $balanceMonetaria2 := data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1035"]/Balance)
   let $expirationOnPeak := data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/expiryDate)
   let $expirationBonus := data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7000"]/ExpiryDate)
   let $expirationMonetaria2 := data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="1035"]/ExpiryDate)
    
   return
     <ns0:SUSCRIPTOR>
     	<ns0:BALANCEONPEAK>{$balanceOnPeak}</ns0:BALANCEONPEAK>
     	<ns0:BALANCEBONUS>{$balanceBonus}</ns0:BALANCEBONUS>
     	<ns0:BALANCEMONETARIA>{$balanceMonetaria2}</ns0:BALANCEMONETARIA>
     	<ns0:MONTOONPEAK>0</ns0:MONTOONPEAK>
     	<ns0:MONTOBONUS>0</ns0:MONTOBONUS>
     	<ns0:MONTOMONETARIA>0</ns0:MONTOMONETARIA>
     	<ns0:ISEXPIREDONPEAK>{xf:isExpiredOCS($expirationOnPeak)}</ns0:ISEXPIREDONPEAK>
     	<ns0:ISEXPIREDBONUS>{xf:isExpiredOCS($expirationBonus)}</ns0:ISEXPIREDBONUS>
     	<ns0:ISEXPIREDMONETARIA>{xf:isExpiredOCS($expirationMonetaria2)}</ns0:ISEXPIREDMONETARIA>
     </ns0:SUSCRIPTOR>	     	
};


declare function xf:getSuscriptorData($input_Parameters1 as element(ns1:Input_Parameters), $montoConsulta)
	{
   let $saldoPendiente := $montoConsulta
   let $balanceOnPeak := data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:Balance)
   let $balanceBonus := data($input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:Balance)
   let $balanceMonetaria2 := data($input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:Balance)
   let $expirationOnPeak := $input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate
   let $expirationBonus := $input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:ExpiryDate
   let $expirationMonetaria2 := $input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:ExpiryDate
    
   return
     <ns0:SUSCRIPTOR>
     	<ns0:BALANCEONPEAK>{$balanceOnPeak}</ns0:BALANCEONPEAK>
     	<ns0:BALANCEBONUS>{$balanceBonus}</ns0:BALANCEBONUS>
     	<ns0:BALANCEMONETARIA>{$balanceMonetaria2}</ns0:BALANCEMONETARIA>
     	<ns0:MONTOONPEAK>0</ns0:MONTOONPEAK>
     	<ns0:MONTOBONUS>0</ns0:MONTOBONUS>
     	<ns0:MONTOMONETARIA>0</ns0:MONTOMONETARIA>
     	<ns0:ISEXPIREDONPEAK>{xf:isExpired($expirationOnPeak)}</ns0:ISEXPIREDONPEAK>
     	<ns0:ISEXPIREDBONUS>{xf:isExpired($expirationBonus)}</ns0:ISEXPIREDBONUS>
     	<ns0:ISEXPIREDMONETARIA>{xf:isExpired($expirationMonetaria2)}</ns0:ISEXPIREDMONETARIA>
     </ns0:SUSCRIPTOR>	     	
};

declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
 {
    	let $fechaCUENTA := xs:date( substring($fechaString, 1, 10) )
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := string( $fechaCUENTA - $duracion )    	
    	
    	let $fechaFormato := concat( substring($fechaExpiracion, 9, 2), ".", substring($fechaExpiracion, 6, 2), ".", substring($fechaExpiracion, 1, 4) )
    	
    	return concat( $fechaFormato, " 23:59:59")
};

declare function xf:calcularProvisionTrama200_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name = "Trama200Provision_DF_Trama200Provision">
            <ns2:parameterList>
                <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ACREDITACUENTA']/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
                        <ns0:TIPOCONSULTA>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='TIPOCONSULTA']/VALOR/text() }</ns0:TIPOCONSULTA>
                        <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='MONTOCUENTA']/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='MONTOCUENTA']/VALOR) }</ns0:MONTOCUENTA>
                        <ns0:CONSULTASREALIZADAS>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CONSULTASREALIZADAS']/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CONSULTASREALIZADAS']/VALOR) }</ns0:CONSULTASREALIZADAS>
                        <ns0:CONSULTASGRATIS>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CONSULTASDIA']/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CONSULTASDIA']/VALOR) }</ns0:CONSULTASGRATIS>
                    </ns0:PARAMETROSNEGOCIO>
	                   {
		                   if ($input_Parameters1/CODIGOIN<51) then
			               xf:getSuscriptorData($input_Parameters1, xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) )
			               else
			               xf:getSuscriptorDataOCS($input_Parameters1)
		               }
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION />
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama200_Req($input_Parameters1)