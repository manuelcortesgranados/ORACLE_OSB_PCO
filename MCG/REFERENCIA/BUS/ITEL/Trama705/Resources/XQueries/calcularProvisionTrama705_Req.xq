(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA705.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama705Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama705Provision/Trama705Provision_DF_Trama705Provision";
declare namespace ns1 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://www.comcel.com.co/CalcularProvisionTrama705/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama705/Resources/XQueries/calcularProvisionTrama705_Req/";


declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
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

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns3:Input_Parameters)){
	let $fafID := $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR/text()
	let $elegidosOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafID]/*:DetailNumber
	return
	<ns0:SUSCRIPTOR>
 		<ns0:BALANCEONPEAK>{0}</ns0:BALANCEONPEAK>
     	<ns0:BALANCEBONUS>{0}</ns0:BALANCEBONUS>
     	<ns0:BALANCEMONETARIA>{0}</ns0:BALANCEMONETARIA>
     	<ns0:BALANCEFREESMS>{0}</ns0:BALANCEFREESMS>
     	<ns0:MONTOONPEAK>0</ns0:MONTOONPEAK>
     	<ns0:MONTOBONUS>0</ns0:MONTOBONUS>
     	<ns0:MONTOMONETARIA>0</ns0:MONTOMONETARIA>
     	<ns0:ISEXPIREDONPEAK>{""}</ns0:ISEXPIREDONPEAK>
     	<ns0:ISEXPIREDBONUS>{""}</ns0:ISEXPIREDBONUS>
     	<ns0:ISEXPIREDMONETARIA>{""}</ns0:ISEXPIREDMONETARIA>
     	<ns0:ISEXPIREDFREESMS>{""}</ns0:ISEXPIREDFREESMS>
     	<ns0:EXPIRATIONDATEFREESMS>{""}</ns0:EXPIRATIONDATEFREESMS>
     	<ns0:CONTRACT>{""}</ns0:CONTRACT>
 	</ns0:SUSCRIPTOR>
};

declare function xf:getSuscriptorData($input_Parameters1 as element(ns3:Input_Parameters))
	{
   let $balanceOnPeak := data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:Balance)
   let $balanceBonus := data($input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:Balance)
   let $balanceMonetaria2 := data($input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:Balance)
   let $expirationOnPeak := $input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate
   let $expirationBonus := $input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:ExpiryDate
   let $expirationMonetaria2 := $input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:ExpiryDate
   let $expirationFreeSMS := $input_Parameters1/SUSCRIPTOR/*:FreeSMSAccountID/*:ExpiryDate
   let $SMSOnNet_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSOnNet_Numbers
   let $SMSOffNet_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSOffNet_Numbers
   let $SMSAny_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSAny_Numbers
   let $contract := data($input_Parameters1/SUSCRIPTOR/*:Contract)
   
   return
     <ns0:SUSCRIPTOR>
     	<ns0:BALANCEONPEAK>{$balanceOnPeak}</ns0:BALANCEONPEAK>
     	<ns0:BALANCEBONUS>{$balanceBonus}</ns0:BALANCEBONUS>
     	<ns0:BALANCEMONETARIA>{$balanceMonetaria2}</ns0:BALANCEMONETARIA>
     	<ns0:BALANCEFREESMS>{$balanceMonetaria2}</ns0:BALANCEFREESMS>
     	<ns0:MONTOONPEAK>0</ns0:MONTOONPEAK>
     	<ns0:MONTOBONUS>0</ns0:MONTOBONUS>
     	<ns0:MONTOMONETARIA>0</ns0:MONTOMONETARIA>
     	<ns0:ISEXPIREDONPEAK>{xf:isExpired($expirationOnPeak)}</ns0:ISEXPIREDONPEAK>
     	<ns0:ISEXPIREDBONUS>{xf:isExpired($expirationBonus)}</ns0:ISEXPIREDBONUS>
     	<ns0:ISEXPIREDMONETARIA>{xf:isExpired($expirationMonetaria2)}</ns0:ISEXPIREDMONETARIA>
     	<ns0:ISEXPIREDFREESMS>{xf:isExpired($expirationFreeSMS)}</ns0:ISEXPIREDFREESMS>
     	<ns0:EXPIRATIONDATEFREESMS>{xf:expirationDate($expirationFreeSMS, xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR)) }</ns0:EXPIRATIONDATEFREESMS>
     	<ns0:CONTRACT>{$contract}</ns0:CONTRACT>
     </ns0:SUSCRIPTOR>	     	
};

declare function xf:calcularProvisionTrama705_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless>
            <ns2:parameterList>
                <ns0:TRAMA_EJECUCION>
                    <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                {
            	if($input_Parameters1/CODIGOIN < 51) then
                    <ns0:PARAMETROSNEGOCIO>	 
                	 	<ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
	                    <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns0:MONTOCUENTA>
	                    <ns0:OFFERID>{""}</ns0:OFFERID>
                    	<ns0:CANTIDAD_MENSAJES>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text() }</ns0:CANTIDAD_MENSAJES>
                    	<ns0:VIGENCIA_MENSAJES>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text() }</ns0:VIGENCIA_MENSAJES>                  
	                </ns0:PARAMETROSNEGOCIO>
	            else
				    <ns0:PARAMETROSNEGOCIO>	 
                	 	<ns0:ACREDITACUENTA>{if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR/text()="0") then "false" else "true" }</ns0:ACREDITACUENTA>
                	 	<ns0:MONTOCUENTA>{0}</ns0:MONTOCUENTA>
	                    <ns0:OFFERID>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='OFFERID']/VALOR/text() }</ns0:OFFERID>
                    	<ns0:CANTIDAD_MENSAJES>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text() }</ns0:CANTIDAD_MENSAJES>
                    	<ns0:VIGENCIA_MENSAJES>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR/text() }</ns0:VIGENCIA_MENSAJES>                  
	                </ns0:PARAMETROSNEGOCIO>	            
	            }
	            {
	            if( $input_Parameters1/CODIGOIN < 51 ) then
	                xf:getSuscriptorData($input_Parameters1)
	                else
					xf:getSuscriptorDataOCS($input_Parameters1) 	                
	            }
	            
                <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                <ns0:SERVICIOSEJECUCION/>
                <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>                
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:calcularProvisionTrama705_Req($input_Parameters1)