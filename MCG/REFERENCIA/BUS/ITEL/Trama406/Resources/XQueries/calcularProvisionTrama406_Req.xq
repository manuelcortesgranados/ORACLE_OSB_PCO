(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA406.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama406Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama406Provision/Trama406Provision_DF_Trama406Provision";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama406/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama406/Resources/XQueries/calcularProvisionTrama406_Req/";

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
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

declare function xf:getAccountExpiryDateOCS($input_Parameters1 as element(ns1:Input_Parameters), $accountID){
	let $fecha:=
	if ( $accountID = 1 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/expiryDate) else
   	 if ( $accountID = 2 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7003"]/ExpiryDate) else
	  if ( $accountID = 3 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="20130"]/ExpiryDate) else
	   if ( $accountID = 4 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7000"]/ExpiryDate) else 
	    if ( $accountID = 5 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10422"]/ExpiryDate) else
	     if ( $accountID = 6 ) then () else
	      if ( $accountID = 7 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10370"]/ExpiryDate) else
	       if ( $accountID = 8 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10380"]/ExpiryDate) else
	        if ( $accountID = 9 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="10390"]/ExpiryDate) else
	         if ( $accountID = 10 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7006"]/ExpiryDate) else
	          if ( $accountID = 11 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7007"]/ExpiryDate) else
	           if ( $accountID = 12 ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/DedicatedAccounts/Detail[Name="7008"]/ExpiryDate)
	        else ()
	   return if(exists($fecha) and $fecha != "") then $fecha else "99991231T12:00:00+0000"      
};

declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
    as xs:integer {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaCUENTA := xs:dateTime(concat(substring($fechaString, 1, 10), "T00:00:00-05:00"))
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := $fechaActual + $duracion
    	let $diferencia := fn:days-from-duration($fechaExpiracion - $fechaCUENTA)
    	return if ($diferencia > 0) then $diferencia else 0 
};

declare function xf:parseDateToOCSFormat($fecha as xs:string) as xs:string{
	let $parsedDate := concat(substring($fecha,1,4),substring($fecha,6,2),substring($fecha,9,2),"T23:59:59-0500")
	return $parsedDate
};


declare function xf:expirationDateOCS($fechaExpiracionActual as xs:string, $diasVigencia as xs:decimal)
    as xs:string {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaCUENTA := xs:dateTime(concat(substring($fechaExpiracionActual, 1, 4),"-",substring($fechaExpiracionActual, 5, 2),"-",substring($fechaExpiracionActual, 7, 2),"T00:00:00-05:00"))
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := $fechaActual + $duracion
    	let $diferencia := fn:days-from-duration($fechaExpiracion - $fechaCUENTA)
    	return if ($fechaExpiracionActual='99991231T12:00:00+0000') then xf:parseDateToOCSFormat(xs:string($fechaExpiracion)) else (if ($diferencia > 0) then xs:string($diferencia) else '0') 
};

declare function xf:calcularProvisionTrama406_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
    	let $cuenta := xf:getAccountName($input_Parameters1,data($input_Parameters1/CODIGOCUENTA))
        return
        <ns2:callFunctionStateless name = "Trama406Provision_DF_Trama406Provision">
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
                        <ns0:MODIFICAVIGENCIACUENTA>true</ns0:MODIFICAVIGENCIACUENTA>
                        <ns0:VIGENCIACUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[7]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[7]/VALOR) }</ns0:VIGENCIACUENTA>                    	 
                    </ns0:PARAMETROSNEGOCIO>
                    }
                    
                    {if ($input_Parameters1/CODIGOIN <= 50) then
                    <ns0:SUSCRIPTOR> 
                        <ns0:CUENTAEXPIRYDATE>{ data($input_Parameters1/SUSCRIPTOR/$cuenta/*:ExpiryDate) }</ns0:CUENTAEXPIRYDATE>
                        <ns0:ISEXPIREDCUENTA>{ xf:isExpired(data($input_Parameters1/SUSCRIPTOR/$cuenta/*:ExpiryDate)) }</ns0:ISEXPIREDCUENTA>
                        <ns0:EXPIRATIONDATE>{ xf:expirationDate(data($input_Parameters1/SUSCRIPTOR/$cuenta/*:ExpiryDate), xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR)) }</ns0:EXPIRATIONDATE>
                        <ns0:CUENTABALANCE>{ xs:decimal($input_Parameters1/SUSCRIPTOR/$cuenta/*:Balance) }</ns0:CUENTABALANCE>
                    </ns0:SUSCRIPTOR>
                    else
                    <ns0:SUSCRIPTOR> 
                        <ns0:CUENTAEXPIRYDATE></ns0:CUENTAEXPIRYDATE>
                        (:ISEXPIREDCUENTA si la cuenta no ha sido inicializada:)
                        <ns0:ISEXPIREDCUENTA>{if ('99991231T12:00:00+0000'=data(xf:getAccountExpiryDateOCS($input_Parameters1,data($input_Parameters1/CODIGOCUENTA)))) then "true" else "false"}</ns0:ISEXPIREDCUENTA>
                        <ns0:EXPIRATIONDATE>{ if(xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[7]/VALOR) > 0) then xf:expirationDateOCS(data(xf:getAccountExpiryDateOCS($input_Parameters1,data($input_Parameters1/CODIGOCUENTA))), xs:decimal($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[7]/VALOR)) else 0}</ns0:EXPIRATIONDATE>
                        <ns0:CUENTABALANCE>0</ns0:CUENTABALANCE>
                    </ns0:SUSCRIPTOR>
                    }
                    <ns0:OFFERID>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='OFFERID']/VALOR/text())}</ns0:OFFERID>   
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION />
                    <ns0:HOSTID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[3]/VALOR) }</ns0:HOSTID>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama406_Req($input_Parameters1)