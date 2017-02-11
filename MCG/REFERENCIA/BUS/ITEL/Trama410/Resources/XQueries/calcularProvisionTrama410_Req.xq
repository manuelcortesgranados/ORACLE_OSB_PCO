(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA410.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama410Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama410Provision/DS_Trama410Provision";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama410/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama410/Resources/XQueries/calcularProvisionTrama410_Req/";

declare function formatFechaISO8601($fechaActual as xs:string) as xs:string {
	let $fechaTemp   :=	replace( substring($fechaActual, 1, 19), "-", ""),
    	$fechaFormateada := concat($fechaTemp, "-0500") 		
	return $fechaFormateada
};

declare function xf:dateFromISO8601($isoDate as xs:string){
	let $fechaFormato := concat( substring($isoDate, 1, 4), "-", substring($isoDate, 5, 2), "-", substring($isoDate, 7, 2) )
	return $fechaFormato
};

declare function xf:isExpiredOCS($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let	$anio := if(number(substring($fechaString, 1, 4)) = 9999) then "1970" else substring($fechaString, 1, 4)	
    	(: let $fechaCUENTA := xs:date(substring($fechaString, 1, 10)) :)
    	let $fechaCUENTA := xs:date(concat($anio,"-",substring($fechaString, 5, 2),"-",substring($fechaString, 7, 2)))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal, $esAumentoVigencia as xs:boolean)
 {
    	let $fechaCUENTA := xs:date( substring($fechaString, 1, 10) )
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := if($esAumentoVigencia = xs:boolean('false') ) then string( $fechaCUENTA - $duracion ) else string( $fechaCUENTA + $duracion )    	
    	
    	let $fechaFormato := concat( substring($fechaExpiracion, 1, 4), "-", substring($fechaExpiracion, 6, 2), "-", substring($fechaExpiracion, 9, 2) )
    	
    	return concat( $fechaFormato, "T23:59:59")
};

declare function xf:getAccountExpiryDate($input_Parameters1 as element(ns1:Input_Parameters)){
	let $cuenta := data($input_Parameters1/CODIGOCUENTA)
 	let $accountExpiryDate := data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:DedicatedAccounts/*:Detail[*:Name = $cuenta ]/*:ExpiryDate)
 	return 
	 	if( empty($accountExpiryDate) = xs:boolean('true') or contains($accountExpiryDate,"1970") = xs:boolean('true') or contains($accountExpiryDate,"9999") = xs:boolean('true')) 
	 		then formatFechaISO8601( substring( string(fn:current-date() ),1,10))
	 	else $accountExpiryDate
};

declare function xf:getMajorDateISO8601($accountDate as xs:string, $calculatedDate as xs:string) {
	let $fechaCuenta := xf:dateFromISO8601($accountDate)
	let $fechaCalculada := xf:dateFromISO8601($calculatedDate)
	return if ($fechaCalculada <= $fechaCuenta) then $accountDate else $calculatedDate
};

declare function xf:getMinorDateISO8601($accountDate as xs:string, $calculatedDate as xs:string) {
	let $fechaCuenta := xf:dateFromISO8601($accountDate)
	let $fechaCalculada := xf:dateFromISO8601($calculatedDate)
	return if ($fechaCalculada <= $fechaCuenta) then $calculatedDate else $accountDate
};

declare function xf:calculateExpiryDate($input_Parameters1 as element(ns1:Input_Parameters)){
	let $diasVigencia := data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE = "DIASVIGENCIA"]/VALOR)
	let $accountExpiryDate := xf:dateFromISO8601( xf:getAccountExpiryDate($input_Parameters1) )
	let $fechaActual := substring(xs:string(current-date()), 1, 10)
	return 
			if ($diasVigencia < 0) 
				then  xf:expirationDate($accountExpiryDate, fn:abs(xs:decimal($diasVigencia)), xs:boolean('false')) 
				else xf:expirationDate($fechaActual, $diasVigencia , xs:boolean('true'))
};

declare function xf:getNewAccountDate( $input_Parameters1 as element(ns1:Input_Parameters) ) {
	let $fechaCalculada := formatFechaISO8601(xf:calculateExpiryDate($input_Parameters1))
	let $fechaCuenta :=  xf:getAccountExpiryDate($input_Parameters1)
	let $diasVigencia := data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE = "DIASVIGENCIA"]/VALOR)
	return 
	 if( $diasVigencia = "" or $diasVigencia = 0) then
	   "SINVIGENCIA"
	 else if ($diasVigencia > 0) then
	  		xf:getMajorDateISO8601($fechaCuenta,$fechaCalculada)
	  	  else
	  		xf:getMinorDateISO8601($fechaCuenta,$fechaCalculada) 
};

declare function xf:calcularProvisionTrama410_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name = "DS_Trama410Provision">
            <ns2:parameterList>
                <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                <ns0:HOSTID>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE = "HOSTID"]/VALOR) }</ns0:HOSTID>
                    <ns0:PARAMETROSTRAMA>
                    	<ns0:DIASVIGENCIA>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE = "DIASVIGENCIA"]/VALOR) }</ns0:DIASVIGENCIA>
                        <ns0:COMENTARIO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE = "COMENTARIO"]/VALOR) }</ns0:COMENTARIO>
                        <ns0:CONSECUTIVO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE = "CONSECUTIVO"]/VALOR) }</ns0:CONSECUTIVO>
                    </ns0:PARAMETROSTRAMA>
                    <ns0:PARAMETROSNEGOCIO>
                        (::     formatFechaISO8601(xf:calculateExpiryDate($input_Parameters1))         ::)
                        <ns0:FECHAVIGENCIA>{ xf:getNewAccountDate($input_Parameters1) }</ns0:FECHAVIGENCIA>
                        <ns0:VALOR>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE = "MONTORECARGA"]/VALOR) }</ns0:VALOR>
                        <ns0:CUENTA>{ data($input_Parameters1/CODIGOCUENTA) }</ns0:CUENTA>
                        <ns0:CUENTAUNITTYPE>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE = "UNITTYPE"]/VALOR) }</ns0:CUENTAUNITTYPE>
                        <ns0:FECHATRANSACCION>{formatFechaISO8601(string(fn:current-dateTime()))}</ns0:FECHATRANSACCION>
                    </ns0:PARAMETROSNEGOCIO>
                    <ns0:SUSCRIPTOR> 
                        <ns0:CUENTAEXPIRYDATE>false</ns0:CUENTAEXPIRYDATE>
                        <ns0:ISEXPIREDCUENTA>false</ns0:ISEXPIREDCUENTA>
                        <ns0:EXPIRATIONDATE>false</ns0:EXPIRATIONDATE>
                        <ns0:CUENTABALANCE>0</ns0:CUENTABALANCE>
                    </ns0:SUSCRIPTOR>
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION />                    
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:calcularProvisionTrama410_Req($input_Parameters1)