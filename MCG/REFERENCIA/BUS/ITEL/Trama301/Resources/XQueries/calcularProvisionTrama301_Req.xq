xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA301.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama301Provision_DB.wsdl" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama301/Resources/XQueries/calcularProvisionTrama301_Req/";
declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama301/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama301Provision/Trama301Provision_DF_Trama301Provision";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

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
   let $bestFnfExpiration := data($input_Parameters1/SUSCRIPTOR/*:BestFnF_ActivationEndTime)
   let $IsBestFnFPossible := data($input_Parameters1/SUSCRIPTOR/*:IsBestFnFPossible)
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
     	<ns0:ISSERVICEACTIVE>{if("TRUE" = $IsBestFnFPossible) then xs:boolean("true") else xs:boolean("false")}</ns0:ISSERVICEACTIVE>
     	<ns0:HASUNLIMITEDCHOSEN>{ count( $bestFnFNumbers//* ) >= 1 }</ns0:HASUNLIMITEDCHOSEN>
     	<ns0:BESTFNFEXPIRYDATE>{$bestFnfExpiration}</ns0:BESTFNFEXPIRYDATE>
     </ns0:SUSCRIPTOR>	     	
};

declare function xf:cargaElegidos($elegidos as xs:string)
 {
		let $listaElegidos := fn:tokenize($elegidos,';')
		for $min in $listaElegidos
		return if( string-length(normalize-space($min))=0)
		then "" 
		else $min
};

declare function xf:calcularProvisionTrama301_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="Trama301Provision_DF_Trama301Provision">
        <ns1:parameterList>
                <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                {if($input_Parameters1/CODIGOIN < 51) then
                  <ns0:MIN_ELEGIDO>{ data($input_Parameters1/MIN_ELEGIDO) }</ns0:MIN_ELEGIDO>
                else
                  <ns0:MIN_ELEGIDO>{ xf:cargaElegidos( data( $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ELEGIDOSNRN']/VALOR )) }</ns0:MIN_ELEGIDO>
                }                
                	{if($input_Parameters1/CODIGOIN < 51) then
                    <ns0:PARAMETROSNEGOCIO>
                    	<ns0:FECHA_REGISTRO_ILIMITADO>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text()}</ns0:FECHA_REGISTRO_ILIMITADO>
                        <ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
                        <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR) }</ns0:MONTOCUENTA>
                        <ns0:VIGENCIA_ILIMITADO>{ xf:duracion( data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR) , data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR)) }</ns0:VIGENCIA_ILIMITADO>
                        <ns0:VALIDA_MIN_COMCEL>{ $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text() }</ns0:VALIDA_MIN_COMCEL>
                    </ns0:PARAMETROSNEGOCIO>
                    else
                    <ns0:PARAMETROSNEGOCIO>
                    	<ns0:FECHA_REGISTRO_ILIMITADO></ns0:FECHA_REGISTRO_ILIMITADO>
                        <ns0:ACREDITACUENTA>{if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR/text()="0") then "false" else "true"}</ns0:ACREDITACUENTA>
                        <ns0:MONTOCUENTA>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR/text()}</ns0:MONTOCUENTA>
                        <ns0:VIGENCIA_ILIMITADO>0</ns0:VIGENCIA_ILIMITADO>
                        <ns0:VALIDA_MIN_COMCEL></ns0:VALIDA_MIN_COMCEL>
                    </ns0:PARAMETROSNEGOCIO>
                    }
                   
                    {
                    if($input_Parameters1/CODIGOIN < 51) then 
                    xf:getSuscriptorData($input_Parameters1, xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) )
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
				     	<ns0:HASUNLIMITEDCHOSEN>false</ns0:HASUNLIMITEDCHOSEN>
				     	<ns0:BESTFNFEXPIRYDATE></ns0:BESTFNFEXPIRYDATE>
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

xf:calcularProvisionTrama301_Req($input_Parameters1)