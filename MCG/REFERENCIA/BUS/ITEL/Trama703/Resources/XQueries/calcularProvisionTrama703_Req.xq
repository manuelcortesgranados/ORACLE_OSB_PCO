(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA703.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../WSDLs/trama703Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama703/";
declare namespace ns3 = "http://xmlns.oracle.com/Trama703Provision/Trama703Provision_DF_Trama703Provision";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama703/Resources/XQueries/calcularProvisionTrama703_Req/";

declare function xf:isEmpty($string as xs:string){
	let $x := if (string-length(normalize-space($string))=0) then "true" else "false"
	return $x
};

declare function xf:fechasExpiracion ($smsOnNet as xs:string, $smsOffNet as xs:string, $smsAnyNet as xs:string)
	as xs:string {
	let $smsOnNetDate := if(xf:isEmpty($smsOnNet)="true") then "1970-01-01 00:00:00" else data ($smsOnNet)
	let $smsOffNetDate := if(xf:isEmpty($smsOffNet)="true") then "1970-01-01 00:00:00" else data ($smsOffNet)
	let $smsAnyNetDate := if(xf:isEmpty($smsAnyNet)="true") then "1970-01-01 00:00:00" else data ($smsAnyNet)
	let $resultado := concat($smsOnNetDate,",",$smsOffNetDate,",",$smsAnyNetDate)
	return $resultado
};

declare function xf:fechaRenovacionValida ($fechaRenovacion as xs:string, $fechaRegistro as xs:string)
	as xs:boolean{
	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
	let $fechaRenov := if($fechaRenovacion = "") then $fechaActual else xs:dateTime(concat(substring($fechaRenovacion, 1, 10), "T00:00:00-05:00"))
	let $fechaRegis := if($fechaRegistro = "") then $fechaActual else xs:dateTime(concat(substring($fechaRegistro, 1, 10), "T00:00:00-05:00"))
	let $diferencia := fn:days-from-duration($fechaRenov - $fechaRegis)
	return if($diferencia>=0) then xs:boolean("true") else xs:boolean("false")  
};


declare function xf:duracion($fechaString as xs:string, $vigencia as xs:decimal, $fechaExpiracion as xs:string)
    as xs:integer {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaExpiracionAnt := if($fechaExpiracion = "") then $fechaActual else xs:dateTime(concat(substring($fechaExpiracion, 1, 10), "T00:00:00-05:00"))
    	let $fechaRecibida := if($fechaString = "") then $fechaActual else xs:dateTime(concat(substring($fechaString, 1, 10), "T00:00:00-05:00"))
    	
    	let $duracion := xdt:dayTimeDuration(concat("P", $vigencia, "D"))
    	let $fechaExpiracionNueva := $fechaRecibida + $duracion
    	let $diferenciaFechaAnterior := fn:days-from-duration($fechaExpiracionAnt - $fechaExpiracionNueva)
    	let $diferenciaFechaActual := fn:days-from-duration($fechaExpiracionNueva - $fechaActual)
    	return if ($diferenciaFechaAnterior >= 0) then 0 else if ($diferenciaFechaActual > 0) then $diferenciaFechaActual else -1 
};

declare function xf:cargaOriginales($elegidos as element())
{
    	for $elegido in $elegidos/*
    	return <ns0:Detail>{data($elegido)}</ns0:Detail>
};
declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:obtenerFechaExpiracion($cuenta as xs:string , $input_Parameters1 as element(ns1:Input_Parameters)){
	let $SMSOnNet_ExpirationDate := $input_Parameters1/SUSCRIPTOR/*:SMSOnNet_ExpirationDate
    let $SMSOffNet_ExpirationDate := $input_Parameters1/SUSCRIPTOR/*:SMSOffNet_ExpirationDate
    let $SMSAny_ExpirationDate := $input_Parameters1/SUSCRIPTOR/*:SMSAny_ExpirationDate
    
	return (if ($cuenta="0") then $SMSOnNet_ExpirationDate else 
	if ($cuenta="1") then $SMSOffNet_ExpirationDate else 
	if ($cuenta="2") then $SMSAny_ExpirationDate else "")
};

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns1:Input_Parameters)){
	let $fafID := $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR/text()
	let $elegidosOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafID]/*:DetailNumber
	return
	<ns0:SUSCRIPTOR>
 		<ns0:BALANCEONPEAK>0</ns0:BALANCEONPEAK>
		<ns0:BALANCEBONUS>0</ns0:BALANCEBONUS>
		<ns0:BALANCEMONETARIA>0</ns0:BALANCEMONETARIA>
		<ns0:MONTOONPEAK>0</ns0:MONTOONPEAK>
		<ns0:MONTOBONUS>0</ns0:MONTOBONUS>
		<ns0:MONTOMONETARIA>0</ns0:MONTOMONETARIA>
		<ns0:ISEXPIREDONPEAK>false</ns0:ISEXPIREDONPEAK>
		<ns0:ISEXPIREDBONUS>false</ns0:ISEXPIREDBONUS>
		<ns0:ISEXPIREDMONETARIA>false</ns0:ISEXPIREDMONETARIA>
		<ns0:ISSERVICEACTIVE>{count ($elegidosOCS/*) >0}</ns0:ISSERVICEACTIVE>
		<ns0:HASUNLIMITEDCHOSEN>false</ns0:HASUNLIMITEDCHOSEN>
		<ns0:ELEGIDOS>{if(count($elegidosOCS)>0) then xf:cargaOriginales($elegidosOCS) else ""}</ns0:ELEGIDOS>
		<ns0:VIGENCIA_ELEGIDO></ns0:VIGENCIA_ELEGIDO>
		<ns0:FECHA_CREACION_ELEGIDO></ns0:FECHA_CREACION_ELEGIDO>
		<ns0:FECHA_EXPIRACION_ELEGIDO></ns0:FECHA_EXPIRACION_ELEGIDO>
 	</ns0:SUSCRIPTOR>
};

declare function xf:getSuscriptorData($input_Parameters1 as element(ns1:Input_Parameters),$codCuenta as xs:string)
	{
   let $balanceOnPeak := data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:Balance)
   let $balanceBonus := data($input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:Balance)
   let $balanceMonetaria2 := data($input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:Balance)
   let $expirationOnPeak := $input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate
   let $expirationBonus := $input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:ExpiryDate
   let $expirationMonetaria2 := $input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:ExpiryDate
   let $SMSOnNet_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSOnNet_Numbers
   let $SMSOffNet_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSOffNet_Numbers
   let $SMSAny_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSAny_Numbers
   let $contract := data($input_Parameters1/SUSCRIPTOR/*:Contract)
   let $vigenciaElegido := data($input_Parameters1/SUSCRIPTOR/*:VIGENCIA_ELEGIDO)
   let $fechaCreacionElegido := data($input_Parameters1/SUSCRIPTOR/*:FECHA_CREACION_ELEGIDO)
   let $fechaExpiracionElegido := data($input_Parameters1/SUSCRIPTOR/*:FECHA_EXPIRACION_ELEGIDO)
   let $suscripcion := data($input_Parameters1/SUSCRIPTOR/*:SUSCRIPCION_ELEGIDO)
   let $SMSOnNet_ExpirationDate := $input_Parameters1/SUSCRIPTOR/*:SMSOnNet_ExpirationDate
   let $SMSOffNet_ExpirationDate := $input_Parameters1/SUSCRIPTOR/*:SMSOffNet_ExpirationDate
   let $SMSAny_ExpirationDate := $input_Parameters1/SUSCRIPTOR/*:SMSAny_ExpirationDate
   
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
     	<ns0:ISSERVICEACTIVE>
     	{
     		if ($codCuenta="0") then count( $SMSOnNet_Numbers//* ) >= 1 else 
			if ($codCuenta="1") then count( $SMSOffNet_Numbers//* ) >= 1 else 
			if ($codCuenta="2") then count( $SMSAny_Numbers//* ) >= 1 else ""
     	}
     	</ns0:ISSERVICEACTIVE>
     	<ns0:CONTRACT>{$contract}</ns0:CONTRACT>
     	<ns0:ELEGIDOS_CUENTA>
     	{
     		if ($codCuenta="0") then xf:cargaOriginales($SMSOnNet_Numbers) else 
			if ($codCuenta="1") then xf:cargaOriginales($SMSOffNet_Numbers) else 
			if ($codCuenta="2") then xf:cargaOriginales($SMSAny_Numbers) else ""
     	}
     	</ns0:ELEGIDOS_CUENTA>
     	<ns0:VIGENCIA_ELEGIDO>{$vigenciaElegido}</ns0:VIGENCIA_ELEGIDO>
     	<ns0:FECHA_CREACION_ELEGIDO>{$fechaCreacionElegido}</ns0:FECHA_CREACION_ELEGIDO>
     	<ns0:FECHA_EXPIRACION_ELEGIDO>{$fechaExpiracionElegido}</ns0:FECHA_EXPIRACION_ELEGIDO>
     	<ns0:SUSCRIPCION_ELEGIDO>{$suscripcion}</ns0:SUSCRIPCION_ELEGIDO>
     	<ns0:FECHA_EXPIRACION_ELEGIDOS>
     	{
 	     xf:fechasExpiracion($SMSOnNet_ExpirationDate,$SMSOffNet_ExpirationDate,$SMSAny_ExpirationDate)
     	}</ns0:FECHA_EXPIRACION_ELEGIDOS>
     </ns0:SUSCRIPTOR>	     	
};

declare function xf:calcularProvisionTrama703_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns3:callFunctionStateless) {
    	let $codCuenta := $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text()
    	return
        <ns3:callFunctionStateless>
            <ns3:parameterList>
                <ns0:TRAMA_EJECUCION>
                    <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                 {
            		if($input_Parameters1/CODIGOIN < 51) then
            		   
                    <ns0:PARAMETROSNEGOCIO>
	                    <ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
	                    <ns0:CODIGO_CUENTA>{$codCuenta}</ns0:CODIGO_CUENTA>
	                    <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR) }</ns0:MONTOCUENTA>
                    	<ns0:VIGENCIA_ILIMITADO>{ if (xf:fechaRenovacionValida($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text(),data($input_Parameters1/SUSCRIPTOR/*:FECHA_CREACION_ELEGIDO))) then xf:duracion($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text(),$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text(), xf:obtenerFechaExpiracion($codCuenta,$input_Parameters1)) else -1 }</ns0:VIGENCIA_ILIMITADO>
                    	<ns0:FECHA_RENOVACION>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text() }</ns0:FECHA_RENOVACION>
	                </ns0:PARAMETROSNEGOCIO>
	                
	             else
	             	<ns0:PARAMETROSNEGOCIO>
	                    <ns0:ACREDITACUENTA>{if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR/text()="0") then "false" else "true" }</ns0:ACREDITACUENTA>
	                    <ns0:MONTOCUENTA>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR/text() }</ns0:MONTOCUENTA>
                    	<ns0:VIGENCIA_ILIMITADO>{ 0 }</ns0:VIGENCIA_ILIMITADO>
	                </ns0:PARAMETROSNEGOCIO>
	             }
	             
                	{
	                if( $input_Parameters1/CODIGOIN < 51 ) then
	                xf:getSuscriptorData($input_Parameters1,$codCuenta)
	                else
					xf:getSuscriptorDataOCS($input_Parameters1) 	                
	                }
                   
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION/>
	                <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama703_Req($input_Parameters1)