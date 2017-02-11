(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA306.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../WSDLs/trama306Provision_DB.wsdl" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama306/";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://xmlns.oracle.com/Trama306Provision/Trama306Provision_DF_Trama306Provision";
declare namespace xf = "http://tempuri.org/ITEL/Trama306/Resources/XQueries/calcularProvisionTrama306_Req/";


declare function xf:duracion($vigencia as xs:decimal)
    as xs:integer {
    	let $fechaActual := xs:dateTime(concat(substring(xs:string(current-date()), 1, 10), "T00:00:00-05:00"))
    	let $duracion := xdt:yearMonthDuration(concat("P", $vigencia, "M"))
    	let $fechaExpiracion := $fechaActual + $duracion
    	let $diferencia := fn:days-from-duration($fechaExpiracion - $fechaActual)
    	return if ($diferencia > 0) then $diferencia else 0 
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
    	return <ns1:Detail>{data($elegido)}</ns1:Detail>
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
   let $FnFNumbers := $input_Parameters1/SUSCRIPTOR/*:FnF_Numbers
   let $fijosNumbers := $input_Parameters1/SUSCRIPTOR/*:FA_Destination
   let $minElegido := $input_Parameters1/MIN_ELEGIDOS
   let $fnfExpiration := data($input_Parameters1/SUSCRIPTOR/*:FnF_ActivationEndTime)
   let $fijosExpiration := data($input_Parameters1/SUSCRIPTOR/*:FA_ActivationEndTime)
   let $isFAPossible := data($input_Parameters1/SUSCRIPTOR/*:IsFAPossible)
   let $isFnFPossible := data($input_Parameters1/SUSCRIPTOR/*:IsFnFPossible)
   return
     <ns1:SUSCRIPTOR>
     	<ns1:BALANCEONPEAK>{$balanceOnPeak}</ns1:BALANCEONPEAK>
     	<ns1:BALANCEBONUS>{$balanceBonus}</ns1:BALANCEBONUS>
     	<ns1:BALANCEMONETARIA>{$balanceMonetaria2}</ns1:BALANCEMONETARIA>
     	<ns1:MONTOONPEAK>0</ns1:MONTOONPEAK>
     	<ns1:MONTOBONUS>0</ns1:MONTOBONUS>
     	<ns1:MONTOMONETARIA>0</ns1:MONTOMONETARIA>
     	<ns1:ISEXPIREDONPEAK>{xf:isExpired($expirationOnPeak)}</ns1:ISEXPIREDONPEAK>
     	<ns1:ISEXPIREDBONUS>{xf:isExpired($expirationBonus)}</ns1:ISEXPIREDBONUS>
     	<ns1:ISEXPIREDMONETARIA>{xf:isExpired($expirationMonetaria2)}</ns1:ISEXPIREDMONETARIA>
     	<ns1:ISSERVICEACTIVE>{ if("TRUE" = $isFnFPossible) then xs:boolean("true") else xs:boolean("false") }</ns1:ISSERVICEACTIVE>
     	<ns1:ISSERVICEACTIVEFIJOS>{ if("TRUE" = $isFAPossible) then xs:boolean("true") else xs:boolean("false") }</ns1:ISSERVICEACTIVEFIJOS>
     	<ns1:HASUNLIMITEDCHOSEN>{ contains( data( $FnFNumbers ), $minElegido) }</ns1:HASUNLIMITEDCHOSEN>
     	<ns1:ELEGIDOS>
     	{ 
	     xf:cargaOriginales($FnFNumbers) 
    	}
    	</ns1:ELEGIDOS>
    	<ns1:ELEGIDOSFIJOS>
     	{ 
	     xf:cargaOriginales($fijosNumbers) 
    	}
    	</ns1:ELEGIDOSFIJOS>
    	<ns1:FNFEXPIRYDATE>{$fnfExpiration}</ns1:FNFEXPIRYDATE>
    	<ns1:FIJOEXPIRYDATE>{$fijosExpiration}</ns1:FIJOEXPIRYDATE>
     </ns1:SUSCRIPTOR>	     	
};
 
 declare function xf:formatearFecha($fechaExpiracion as xs:string)
	as xs:string {
		let $dia  := fn:substring($fechaExpiracion, 7, 2)
	    let $mes  := fn:substring($fechaExpiracion, 5, 2)
	    let $anio := fn:substring($fechaExpiracion, 1, 4)
    	return
    		concat($anio, "-", $mes, "-", $dia)
};

declare function xf:isExpiredOCS($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := current-dateTime()
    	return
    	if($fechaString="") then
    		xs:boolean("false")
    	else	
			let $fechaCUENTA := fn-bea:dateTime-from-string-with-format("yyyyMMddHHmmss",$fechaString)
    		return if ($fechaActual <= $fechaCUENTA) then xs:boolean("false") else xs:boolean("true")
};

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns2:Input_Parameters))
{
   let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))     
    	
   let $fafIdFijos := $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID_FA']/VALOR/text()
   let $fafIdMoviles := $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='FAFID_FNF']/VALOR/text()
   let $elegidosMovilesOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafIdMoviles]/*:DetailNumber
   let $elegidosFijosOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafIdFijos]/*:DetailNumber   
   (: let $DateMovilesOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafIdMoviles]/*:expiryDate :)
   (: let $DateFijosOCS   := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafIdFijos]/*:expiryDate :)
   let $DateMovilesOCS := $input_Parameters1/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION/result[fafID=concat($fafIdMoviles)]/expiryDate
   let $DateFijosOCS   := $input_Parameters1/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION/result[fafID=$fafIdFijos]/expiryDate    
   let $fafMovilesActive := $input_Parameters1/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION/result[fafID=$fafIdMoviles]/fafID
   let $fafFijosActive := $input_Parameters1/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION/result[fafID=$fafIdFijos]/fafID
   
   return
     <ns1:SUSCRIPTOR>
     	<ns1:BALANCEONPEAK>0</ns1:BALANCEONPEAK>
     	<ns1:BALANCEBONUS>0</ns1:BALANCEBONUS>
     	<ns1:BALANCEMONETARIA>0</ns1:BALANCEMONETARIA>
     	<ns1:MONTOONPEAK>0</ns1:MONTOONPEAK>
     	<ns1:MONTOBONUS>0</ns1:MONTOBONUS>
     	<ns1:MONTOMONETARIA>0</ns1:MONTOMONETARIA>
     	<ns1:ISEXPIREDONPEAK>false</ns1:ISEXPIREDONPEAK>
     	<ns1:ISEXPIREDBONUS>false</ns1:ISEXPIREDBONUS>
     	<ns1:ISEXPIREDMONETARIA>false</ns1:ISEXPIREDMONETARIA>
     	<ns1:ISSERVICEACTIVE>{if ($fafMovilesActive=$fafIdMoviles and not(xf:isExpiredOCS($DateMovilesOCS))) then 'true' else 'false'}</ns1:ISSERVICEACTIVE>
     	<ns1:ISSERVICEACTIVEFIJOS>{'true'}</ns1:ISSERVICEACTIVEFIJOS>
     	<ns1:HASUNLIMITEDCHOSEN>false</ns1:HASUNLIMITEDCHOSEN>
     	<ns1:ELEGIDOS>{if(count($elegidosMovilesOCS)>0) then xf:cargaOriginales($elegidosMovilesOCS) else ""}</ns1:ELEGIDOS>
    	<ns1:ELEGIDOSFIJOS>{if(count($elegidosFijosOCS)>0) then xf:cargaOriginales($elegidosFijosOCS) else ""}</ns1:ELEGIDOSFIJOS>
    	<ns1:FNFEXPIRYDATE>{$fafIdMoviles}</ns1:FNFEXPIRYDATE>
    	<ns1:FIJOEXPIRYDATE>{$fafIdFijos}</ns1:FIJOEXPIRYDATE>
     </ns1:SUSCRIPTOR>	     	
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
		return if( string-length(normalize-space($min))=0)
		then "" 
		else <ns1:Detail>{fn:normalize-space($min)}</ns1:Detail>
};


declare function xf:calcularProvisionTrama306_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name="Trama306Provision_DF_Trama306Provision">
            <ns0:parameterList>
                <ns1:TRAMA_EJECUCION>
                <ns1:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns1:MIN>
                {if($input_Parameters1/CODIGOIN < 51) then
                	<ns1:MIN_ELEGIDOS>{ xf:cargaElegidos( data($input_Parameters1/MIN_ELEGIDOS) ) }</ns1:MIN_ELEGIDOS>
                 else	
                    <ns1:MIN_ELEGIDOS>{ xf:cargaElegidos( data( $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ELEGIDOSNRN']/VALOR )) }</ns1:MIN_ELEGIDOS>
                }
                <ns1:MIN_ELEGIDOS_FIJOS>{ xf:cargaElegidos( data($input_Parameters1/MIN_ELEGIDOS_FIJOS) ) }</ns1:MIN_ELEGIDOS_FIJOS>
                	{if($input_Parameters1/CODIGOIN < 51) then
                    <ns1:PARAMETROSNEGOCIO>
                        <ns1:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text())  then "true" else "false" }</ns1:ACREDITACUENTA>
                        <ns1:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns1:MONTOCUENTA>
                        <ns1:VIGENCIA_ILIMITADO>{ xf:duracion( data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[4]/VALOR)) }</ns1:VIGENCIA_ILIMITADO>
                    </ns1:PARAMETROSNEGOCIO>
                    else
                    <ns1:PARAMETROSNEGOCIO>
                        <ns1:ACREDITACUENTA>{if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='BONIFICAR']/VALOR/text()="1") then "true" else "false"}</ns1:ACREDITACUENTA>
                        <ns1:MONTOCUENTA>0</ns1:MONTOCUENTA>
                        <ns1:VIGENCIA_ILIMITADO>0</ns1:VIGENCIA_ILIMITADO>
                        <ns1:ESPOSTPAGO>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ESPOSTPAGO']/VALOR/text()}</ns1:ESPOSTPAGO>
                        <ns1:CANTIDAD_CAMBIOS_FNF>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='CAMBIOS_FNF']/VALOR/text()}</ns1:CANTIDAD_CAMBIOS_FNF>
						<ns1:VALIDARFNF>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='VALIDARFNF']/VALOR/text()}</ns1:VALIDARFNF>                        
                    </ns1:PARAMETROSNEGOCIO>
                    
                    }
                    {if($input_Parameters1/CODIGOIN < 51) then
	                    xf:getSuscriptorData($input_Parameters1, xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) ) 
	                else
	                	xf:getSuscriptorDataOCS($input_Parameters1)
                    }
                    <ns1:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns1:CODIGOPLATAFORMA>
                    <ns1:SERVICIOSEJECUCION />
                    <ns1:ERROR>1</ns1:ERROR>
                </ns1:TRAMA_EJECUCION>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:calcularProvisionTrama306_Req($input_Parameters1)