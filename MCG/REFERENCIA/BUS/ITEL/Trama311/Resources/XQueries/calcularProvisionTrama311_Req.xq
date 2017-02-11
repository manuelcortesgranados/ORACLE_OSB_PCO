xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA311.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama311Provision_DB.wsdl" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama311/Resources/XQueries/calcularProvisionTrama311_Req/";
declare namespace ns2 = "http://xmlns.oracle.com/Trama311Provision/Trama311Provision_DF_Trama311Provision";
declare namespace ns1 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://www.comcel.com.co/CalcularProvisionTrama311/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";


declare function xf:duracion($fechaString as xs:string, $vigencia as xs:decimal, $fechaExpiracion as xs:string)
    as xs:integer {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $fechaRecibida := if($fechaString = "") then $fechaActual else xs:dateTime(concat(substring($fechaString, 1, 10), "T00:00:00-05:00"))
    	let $fechaExpiracionAnt := if($fechaExpiracion = "") then $fechaActual else xs:dateTime(concat(substring($fechaExpiracion, 1, 10), "T00:00:00-05:00"))
    	let $duracion := xdt:yearMonthDuration(concat("P", $vigencia, "M"))
    	
    	let $fechaExpiracionNueva := $fechaRecibida + $duracion
    	let $diferenciaNuevaActual := fn:days-from-duration($fechaExpiracionNueva - $fechaActual)
    	let $diferenciaNuevaAnterior := fn:days-from-duration($fechaExpiracionAnt - $fechaExpiracionNueva)
    	return if ($diferenciaNuevaAnterior >= 0) then 0 else if ($diferenciaNuevaActual > 0) then $diferenciaNuevaActual else -1
};

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:cargaOriginales($elegidos as element())
{
    	for $elegido in $elegidos/*
    	return <ns0:Detail>{data($elegido)}</ns0:Detail>
};

declare function xf:getSuscriptorData($input_Parameters1 as element(ns3:Input_Parameters), $montoConsulta)
	{
   let $saldoPendiente := $montoConsulta
   let $balanceOnPeak := data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:Balance)
   let $balanceBonus := data($input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:Balance)
   let $balanceMonetaria2 := data($input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:Balance)
   let $expirationOnPeak := $input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate
   let $expirationBonus := $input_Parameters1/SUSCRIPTOR/*:BonusAccountID/*:ExpiryDate
   let $expirationMonetaria2 := $input_Parameters1/SUSCRIPTOR/*:MonetaryAccountID2/*:ExpiryDate
   let $bestFnFNumbers := $input_Parameters1/SUSCRIPTOR/*:FnF_Numbers
   let $minElegido := $input_Parameters1/MIN_ELEGIDOS
   let $vigenciaElegido := data($input_Parameters1/SUSCRIPTOR/*:VIGENCIA_ELEGIDO)
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
     	<ns0:HASUNLIMITEDCHOSEN>{ contains( data( $bestFnFNumbers ), $minElegido) }</ns0:HASUNLIMITEDCHOSEN>
     	<ns0:VIGENCIA_ELEGIDO>{$vigenciaElegido}</ns0:VIGENCIA_ELEGIDO>
     	<ns0:FECHA_CREACION_ELEGIDO>{$fechaCreacionElegido}</ns0:FECHA_CREACION_ELEGIDO>
     	<ns0:FECHA_EXPIRACION_ELEGIDO>{$fechaExpiracionElegido}</ns0:FECHA_EXPIRACION_ELEGIDO>
     	<ns0:ELEGIDOS>
 		{ 
	     xf:cargaOriginales($bestFnFNumbers) 
    	}
     	</ns0:ELEGIDOS>
     </ns0:SUSCRIPTOR>	     	
};

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns3:Input_Parameters))
{
   
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
     	<ns0:VIGENCIA_ELEGIDO></ns0:VIGENCIA_ELEGIDO>
     	<ns0:FECHA_CREACION_ELEGIDO></ns0:FECHA_CREACION_ELEGIDO>
     	<ns0:FECHA_EXPIRACION_ELEGIDO></ns0:FECHA_EXPIRACION_ELEGIDO>
     	<ns0:ELEGIDOS></ns0:ELEGIDOS>
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


declare function xf:cargaElegidos($elegidos as xs:string)
 {
    	let $listaElegidos := fn:tokenize($elegidos,';')
    	for $min in $listaElegidos
    	return <ns0:Detail>{ fn:normalize-space($min) }</ns0:Detail>
};

declare function xf:calcularProvisionTrama311_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns2:callFunctionStateless) {
    	let $fechaExpiracion := $input_Parameters1/SUSCRIPTOR/*:BestFnF_ActivationEndTime
    	return
        <ns2:callFunctionStateless name="Trama311Provision_DF_Trama311Provision">
        <ns2:parameterList>
	        <ns0:TRAMA_EJECUCION>
	                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
	                {if($input_Parameters1/CODIGOIN < 51) then	                  
	                  <ns0:MIN_ELEGIDOS>{ xf:cargaElegidos( data($input_Parameters1/MIN_ELEGIDOS) ) }</ns0:MIN_ELEGIDOS>
	                else
	                   let $params := fn:tokenize(data( $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ELEGIDOSNRN']/VALOR ), ';'),
        			   $elegidos   := $params,
        			   $listElegidos:= fn:subsequence($params, fn:count($elegidos) div 2),
        			   $minElegidos := string-join(
		                    		   for $i in (1 to fn:count($listElegidos)-1) 
		                                return $elegidos[$i]
		                               , ";")
        			   return
	                  <ns0:MIN_ELEGIDOS>{ xf:cargaElegidos($minElegidos) }</ns0:MIN_ELEGIDOS>
	                }
	                {if($input_Parameters1/CODIGOIN < 51) then
	                 <ns0:MIN_ELEGIDOS_REEMPLAZAR>{ xf:cargaElegidos( data($input_Parameters1/MIN_ELEGIDOS_REEMPLAZAR) ) }</ns0:MIN_ELEGIDOS_REEMPLAZAR>
	                else
	                   let $params := fn:tokenize(data( $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ELEGIDOSNRN']/VALOR ), ';'),
        			   $elegidos   := $params,
        			   $listElegidos:= fn:subsequence(($params), fn:count($elegidos) div 2 + 1, fn:count($elegidos)),
        			   $minElegidos := string-join(
		                    		   $listElegidos
		                               , ";")
        			   return
	                   <ns0:MIN_ELEGIDOS_REEMPLAZAR>{ xf:cargaElegidos($minElegidos)}</ns0:MIN_ELEGIDOS_REEMPLAZAR>
	                 }
	                	{if($input_Parameters1/CODIGOIN < 51) then
	                    <ns0:PARAMETROSNEGOCIO>
	                        <ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
	                        <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR) }</ns0:MONTOCUENTA>
	                        <ns0:VIGENCIA_ILIMITADO>{ xf:duracion( data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR) , data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR),$fechaExpiracion) }</ns0:VIGENCIA_ILIMITADO>
	                    </ns0:PARAMETROSNEGOCIO>
	                    else
	                    <ns0:PARAMETROSNEGOCIO>
	                        <ns0:ACREDITACUENTA>{if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR/text()="0") then "false" else "true"}</ns0:ACREDITACUENTA>
	                        <ns0:MONTOCUENTA>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID']/VALOR/text()}</ns0:MONTOCUENTA>
	                        <ns0:VIGENCIA_ILIMITADO>0</ns0:VIGENCIA_ILIMITADO>
	                        <ns0:ESPOSTPAGO>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ESPOSTPAGO']/VALOR/text()}</ns0:ESPOSTPAGO>
                            <ns0:CANTIDAD_CAMBIOS_FNF>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CAMBIOS_FNF']/VALOR/text()}</ns0:CANTIDAD_CAMBIOS_FNF>  	                        
	                    </ns0:PARAMETROSNEGOCIO>
	                    }
	                    {if($input_Parameters1/CODIGOIN < 51) then
	                    	xf:getSuscriptorData($input_Parameters1, xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR) )
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

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:calcularProvisionTrama311_Req($input_Parameters1)