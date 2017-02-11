(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA303.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama303Provision_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama303/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama303Provision/Trama303Provision_DF_Trama303Provision";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama303/Resources/XQueries/calcularProvisionTrama303_Req/";


declare function xf:duracion($fechaString as xs:string, $vigencia as xs:decimal)
    as xs:integer {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaRecibida := if($fechaString = "") then $fechaActual else xs:dateTime(concat(substring($fechaString, 1, 10), "T00:00:00-05:00"))
    	let $duracion := xdt:yearMonthDuration(concat("P", $vigencia, "M"))
    	let $fechaExpiracion := $fechaRecibida + $duracion
    	let $diferencia := fn:days-from-duration($fechaExpiracion - $fechaActual)
    	return $diferencia 
};

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:getSuscriptorData($input_Parameters1 as element(ns2:Input_Parameters), $montoConsulta)
	{
   let $saldoPendiente := $montoConsulta
   let $balanceOnPeak := data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:Balance)
   let $balanceBonus := data($input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:Balance)
   let $balanceMonetaria2 := data($input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:Balance)
   let $expirationOnPeak := $input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate
   let $expirationBonus := $input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:ExpiryDate
   let $expirationMonetaria2 := $input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:ExpiryDate
   let $bestFnFNumbers := $input_Parameters1/SUSCRIPTOR/*:BestFnF_Numbers
   let $minElegido := $input_Parameters1/MIN_ELEGIDO
   let $vigencia := data($input_Parameters1/SUSCRIPTOR/*:VIGENCIA_ELEGIDO)
   let $fechaCreacionElegido := data($input_Parameters1/SUSCRIPTOR/*:FECHA_CREACION_ELEGIDO)
   let $fechaExpiracionElegido := data($input_Parameters1/SUSCRIPTOR/*:FECHA_EXPIRACION_ELEGIDO)
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
     	<ns0:ISSERVICEACTIVE>{ count( $bestFnFNumbers//* ) >= 1 }</ns0:ISSERVICEACTIVE>
     	<ns0:VIGENCIA_ELEGIDO>{$vigencia}</ns0:VIGENCIA_ELEGIDO>
     	<ns0:FECHA_CREACION_ELEGIDO>{$fechaCreacionElegido}</ns0:FECHA_CREACION_ELEGIDO>
     	<ns0:FECHA_EXPIRACION_ELEGIDO>{$fechaExpiracionElegido}</ns0:FECHA_EXPIRACION_ELEGIDO>
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

declare function xf:calcularProvisionTrama303_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="Trama303Provision_DF_Trama303Provision">
            <ns1:parameterList>
                <ns0:TRAMA_EJECUCION>
                    <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                    <ns0:MIN_ELEGIDO>{if (count( $input_Parameters1/SUSCRIPTOR/*:BestFnF_Numbers//* ) >= 1) then $input_Parameters1/SUSCRIPTOR/*:BestFnF_Numbers/*:Detail[1]/text() else xs:decimal("0")}</ns0:MIN_ELEGIDO>
                    {if($input_Parameters1/CODIGOIN < 51) then
	                    <ns0:PARAMETROSNEGOCIO>
	                    	<ns0:FECHA_RENOVACION>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text()}</ns0:FECHA_RENOVACION>
	                        <ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
	                        <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR) }</ns0:MONTOCUENTA>
	                        <ns0:VIGENCIA_ILIMITADO>{ xf:duracion( data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR) , data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR)) }</ns0:VIGENCIA_ILIMITADO>
	                    </ns0:PARAMETROSNEGOCIO>
                    else
	                    <ns0:PARAMETROSNEGOCIO>
		                    	<ns0:FECHA_REGISTRO_ILIMITADO></ns0:FECHA_REGISTRO_ILIMITADO>
		                        <ns0:ACREDITACUENTA>{if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR/text()="0") then "false" else "true"}</ns0:ACREDITACUENTA>
		                        <ns0:MONTOCUENTA>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR/text()}</ns0:MONTOCUENTA>
		                        <ns0:VIGENCIA_ILIMITADO>0</ns0:VIGENCIA_ILIMITADO>
	                    </ns0:PARAMETROSNEGOCIO>
                    }
                	{
                	if($input_Parameters1/CODIGOIN < 51) then
                    	xf:getSuscriptorData($input_Parameters1, xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR) )
                    else
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
					     	<ns0:ISSERVICEACTIVE>true</ns0:ISSERVICEACTIVE>
					     	<ns0:VIGENCIA_ELEGIDO>0</ns0:VIGENCIA_ELEGIDO>
					     	<ns0:FECHA_CREACION_ELEGIDO></ns0:FECHA_CREACION_ELEGIDO>
					     	<ns0:FECHA_EXPIRACION_ELEGIDO></ns0:FECHA_EXPIRACION_ELEGIDO>
					     </ns0:SUSCRIPTOR>
                    }
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION />
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:calcularProvisionTrama303_Req($input_Parameters1)