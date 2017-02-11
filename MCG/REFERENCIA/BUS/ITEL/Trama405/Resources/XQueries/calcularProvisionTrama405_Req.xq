(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA405.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama405Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama405Provision/Trama405Provision_DF_Trama405Provision";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama405/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama405/Resources/XQueries/calcularProvisionTrama405_Req/";

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:getAccountExpiryDateOCS($input_Parameters1 as element(ns1:Input_Parameters), $accountID){
	if ( $accountID = 1 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/expiryDate) else
   	 if ( $accountID = 2 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7003"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7003"]/ExpiryDate) else
	  if ( $accountID = 3 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="20130"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="20130"]/ExpiryDate) else
	   if ( $accountID = 4 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7000"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7000"]/ExpiryDate) else 
	    if ( $accountID = 5 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10422"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10422"]/ExpiryDate) else
	     if ( $accountID = 6 ) then () else
	      if ( $accountID = 7 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10370"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10370"]/ExpiryDate) else
	       if ( $accountID = 8 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10380"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10380"]/ExpiryDate) else
	        if ( $accountID = 9 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10390"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10390"]/ExpiryDate) else 
	         if ( $accountID = 10 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7006"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7006"]/ExpiryDate)  else
	          if ( $accountID = 11 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7007"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7007"]/ExpiryDate) else
	           if ( $accountID = 12 and exists($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7008"])) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7008"]/ExpiryDate)
	        else ("20300101T12:00:00+0000")
};

declare function xf:isExpiredOCS($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let	$anio := if(number(substring($fechaString, 1, 4)) = 9999) then "1970" else substring($fechaString, 1, 4)	
    	(: let $fechaCUENTA := xs:date(substring($fechaString, 1, 10)) :)
    	let $fechaCUENTA := xs:date(concat($anio,"-",substring($fechaString, 5, 2),"-",substring($fechaString, 7, 2)))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:isValidExpirationDate($diasVigencia as xs:decimal,$fechaC as xs:string)
    as xs:boolean {
    	let $fechaCUENTA := xs:date( substring($fechaC, 1, 10) )
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := xs:date( string( $fechaCUENTA - $duracion ) )   
    	
    	return if ($fechaExpiracion < $fechaActual) then xs:boolean("false") else xs:boolean("true")
};

declare function xf:getAccountName($input_Parameters1 as element(ns1:Input_Parameters),$accountID){
  if ( $accountID = 1 ) then $input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID else
   	if ( $accountID = 2 ) then $input_Parameters1/SUSCRIPTOR/*:OffPeakAccountID else
	 if ( $accountID = 3 ) then $input_Parameters1/SUSCRIPTOR/*:FreeSMSAccountID else
	  if ( $accountID = 4 ) then $input_Parameters1/SUSCRIPTOR/*:BonusAccountID else 
	   if ( $accountID = 5 )  then $input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2 else
	    if ( $accountID = 6 ) then $input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID3 else
	     if ( $accountID = 7 ) then $input_Parameters1/SUSCRIPTOR/*:MinutesAccountID2 else
	      if ( $accountID = 8 ) then $input_Parameters1/SUSCRIPTOR/*:MinutesAccountID3 else
	       if ( $accountID = 9 ) then $input_Parameters1/SUSCRIPTOR/*:MinutesAccountID4 else $input_Parameters1/SUSCRIPTOR/none
};

declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
 {
    	let $fechaCUENTA := xs:date( substring($fechaString, 1, 10) )
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := string( $fechaCUENTA - $duracion )    	
    	
    	let $fechaFormato := concat( substring($fechaExpiracion, 9, 2), ".", substring($fechaExpiracion, 6, 2), ".", substring($fechaExpiracion, 1, 4) )
    	
    	return concat( $fechaFormato, " 23:59:59")
};

declare function xf:calcularProvisionTrama405_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
    	let $cuenta := xf:getAccountName($input_Parameters1,data($input_Parameters1/CODIGOCUENTA))
        let $vigencia := xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR)
        let $expirationDate := xf:expirationDate(data($input_Parameters1/SUSCRIPTOR/$cuenta/*:ExpiryDate), $vigencia )
        return
        <ns2:callFunctionStateless name = "Trama405Provision_DF_Trama405Provision">
            <ns2:parameterList>
                <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                <ns0:CODIGOCUENTA> { data($input_Parameters1/CODIGOCUENTA) } </ns0:CODIGOCUENTA>
                    <ns0:PARAMETROSTRAMA>
                        <ns0:COMENTARIO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[2]/VALOR) }</ns0:COMENTARIO>
                        <ns0:CONSECUTIVO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[4]/VALOR) }</ns0:CONSECUTIVO>
                    </ns0:PARAMETROSTRAMA>
                    {if ($input_Parameters1/CODIGOIN <= 50) then
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
                        <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns0:MONTOCUENTA>
                        <ns0:MODIFICAVIGENCIACUENTA>{ if ("TRUE" = $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text()) then "true" else "false" }</ns0:MODIFICAVIGENCIACUENTA>
                        <ns0:VIGENCIACUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR) }</ns0:VIGENCIACUENTA>
                    </ns0:PARAMETROSNEGOCIO>
                    else
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITACUENTA>false</ns0:ACREDITACUENTA>
                        <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[5]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[5]/VALOR) }</ns0:MONTOCUENTA>
                        <ns0:MODIFICAVIGENCIACUENTA>false</ns0:MODIFICAVIGENCIACUENTA>
                        <ns0:VIGENCIACUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[7]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[7]/VALOR) }</ns0:VIGENCIACUENTA>
                    </ns0:PARAMETROSNEGOCIO>
                    }
                    {if ($input_Parameters1/CODIGOIN <= 50) then
                    <ns0:SUSCRIPTOR> 
                       <ns0:CUENTAEXPIRYDATE>{ data($input_Parameters1/SUSCRIPTOR/$cuenta/*:ExpiryDate) }</ns0:CUENTAEXPIRYDATE>
                        <ns0:ISVALIDEXPIRATION>{ xf:isValidExpirationDate( $vigencia,  data($input_Parameters1/SUSCRIPTOR/$cuenta/*:ExpiryDate) ) } </ns0:ISVALIDEXPIRATION>
                        <ns0:ISEXPIREDCUENTA>{ xf:isExpired(data($input_Parameters1/SUSCRIPTOR/$cuenta/*:ExpiryDate)) }</ns0:ISEXPIREDCUENTA>
                        <ns0:EXPIRATIONDATE>{ data( $expirationDate ) }</ns0:EXPIRATIONDATE>
                        <ns0:CUENTABALANCE>{ xs:decimal($input_Parameters1/SUSCRIPTOR/$cuenta/*:Balance) }</ns0:CUENTABALANCE>
                    </ns0:SUSCRIPTOR>
                    else
                    <ns0:SUSCRIPTOR> 
                       <ns0:CUENTAEXPIRYDATE></ns0:CUENTAEXPIRYDATE>
                        <ns0:ISVALIDEXPIRATION>true</ns0:ISVALIDEXPIRATION>
                        <ns0:ISEXPIREDCUENTA>{ if(xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[5]/VALOR) > 0) then xf:isExpiredOCS( xf:getAccountExpiryDateOCS($input_Parameters1,$input_Parameters1/CODIGOCUENTA ) ) else "false" }</ns0:ISEXPIREDCUENTA>
                        <ns0:EXPIRATIONDATE></ns0:EXPIRATIONDATE>
                        <ns0:CUENTABALANCE>0</ns0:CUENTABALANCE>
                    </ns0:SUSCRIPTOR>
                    }  
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION />
                    <ns0:HOSTID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[3]/VALOR) }</ns0:HOSTID>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama405_Req($input_Parameters1)