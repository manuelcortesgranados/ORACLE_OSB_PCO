xquery version "1.0" encoding "UTF-8";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA313.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama313Provision_DB.wsdl" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama313/Resources/XQueries/calcularProvisionTrama313_Req/";
declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama313/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/Trama313Provision/DS_Trama313Provision";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";


declare function formatFechaISO8601($fechaActual as xs:string) as xs:string {
	let $fechaTemp   :=	replace( substring($fechaActual, 1, 19), "-", ""),
    	$fechaFormateada := concat($fechaTemp, "-0500") 		
	return $fechaFormateada
};

declare function xf:dateFromISO8601($isoDate as xs:string){
	let $fechaFormato := concat( substring($isoDate, 1, 4), "-", substring($isoDate, 5, 2), "-", substring($isoDate, 7, 2) )
	return $fechaFormato
};

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ( $fechaActual >= $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:cargaOriginales($elegidos as element())
{
    	for $elegido in $elegidos/*
    	return <ns0:Detail>{data($elegido)}</ns0:Detail>
};

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns2:Input_Parameters)){
	let $fafID := data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="FAF_ID"]/VALOR)
	let $elegidosOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafID]/*:DetailNumber
	return
	<ns0:SUSCRIPTOR>
 		<ns0:ISSERVICEACTIVE>true</ns0:ISSERVICEACTIVE>
		<ns0:ELEGIDOS>{if(count($elegidosOCS)>0) then xf:cargaOriginales($elegidosOCS) else ""}</ns0:ELEGIDOS>
	</ns0:SUSCRIPTOR>
};

declare function xf:validaOferta($input_Parameters1 as element(ns2:Input_Parameters)){
	let $fafID   := $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="FAF_ID"]/VALOR
	let $listado := $input_Parameters1/SUSCRIPTOR_OCS/DATOS_SUSCRIPCION/result[fafID=$fafID]
	return if ( fn:empty($listado) =  xs:boolean("true") ) then xs:boolean("false") else xf:validaEstadoOferta($listado)
};

declare function xf:validaEstadoOferta($listado as element(*) ){
	let $fechaExpiracion := $listado/expiryDate
	let $activeFlag := $listado/subscriptionStatus
	let $isExpired := if(not($fechaExpiracion = '')) then xf:isExpired(xf:dateFromISO8601($fechaExpiracion)) else  xs:boolean("false") 
	return if($isExpired = xs:boolean("true") or $activeFlag != 'ACTIVE') then xs:boolean("false") else xs:boolean("true")
};

declare function xf:expirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
 {
    	let $fechaCUENTA := xs:date( substring($fechaString, 1, 10) )
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := string( $fechaCUENTA - $duracion )    	
    	
    	let $fechaFormato := concat( substring($fechaExpiracion, 9, 2), ".", substring($fechaExpiracion, 6, 2), ".", substring($fechaExpiracion, 1, 4) )
    	
    	return concat( $fechaFormato, " 23:59:59")
};

declare function xf:calculaExpirationDate($fechaString as xs:string, $diasVigencia as xs:decimal)
 {
    	let $fechaCUENTA := xs:date( substring($fechaString, 1, 10) )
    	let $duracion := xdt:dayTimeDuration(concat("P", $diasVigencia, "D"))
    	let $fechaExpiracion := string( $fechaCUENTA + $duracion )    	
    	
    	
    	let $fechaFormato := concat( substring($fechaExpiracion, 1, 4), "", substring($fechaExpiracion, 6, 2), "", substring($fechaExpiracion, 9, 2), "T12:00:00+0000" )
    	
    	return concat( $fechaFormato)
};

declare function xf:cargaElegidos($elegidos as xs:string)
 {
    	let $listaElegidos := fn:tokenize($elegidos,';')
    	for $min in $listaElegidos
    	return <ns0:Detail>{fn:normalize-space($min)}</ns0:Detail>
};

declare function xf:calcularProvisionTrama313_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless)  {
    <ns1:callFunctionStateless name="DS_Trama313Provision">
            <ns1:parameterList>
               <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                <ns0:MIN_ELEGIDOS>{ xf:cargaElegidos( data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="ELEGIDOSNRN"]/VALOR) ) }</ns0:MIN_ELEGIDOS>               
				<ns0:PARAMETERS>
                   <ns0:OFERTA>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="FAF_ID"]/VALOR) }</ns0:OFERTA>
                   <ns0:VIGENCIA>{  
                     if (data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE="DIASVIGENCIA"]/VALOR) != "0") then
                     xf:calculaExpirationDate(string(fn:current-dateTime()),data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE="DIASVIGENCIA"]/VALOR))
                     else
                      "" 
                   }</ns0:VIGENCIA>
                   <ns0:TIPO_OFERTA>{ data($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE="OFFER_ID"]/VALOR) }</ns0:TIPO_OFERTA>
                   <ns0:FECHA_TRANSACCION>{ formatFechaISO8601(string(fn:current-dateTime())) }</ns0:FECHA_TRANSACCION>
                   <ns0:CODIGO_COBRO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE="BONIFICAR"]/VALOR) }</ns0:CODIGO_COBRO>
                   <ns0:OFERTA_ACTIVA>{ data(xf:validaOferta($input_Parameters1)) }</ns0:OFERTA_ACTIVA>
                   <ns0:USUARIO_ITEL>{ "ITEL" }</ns0:USUARIO_ITEL>                                                     
                </ns0:PARAMETERS>
                {             
                	xf:getSuscriptorDataOCS($input_Parameters1)
            	}                     
                <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                <ns0:SERVICIOSEJECUCION />
                <ns0:ERROR>1</ns0:ERROR>
            </ns0:TRAMA_EJECUCION>
        	</ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:calcularProvisionTrama313_Req($input_Parameters1)