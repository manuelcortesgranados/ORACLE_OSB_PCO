xquery version "1.0" encoding "UTF-8";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA315.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama315Provision_DB.wsdl" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama315/Resources/XQueries/calcularProvisionTrama315_Req/";
declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama315/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/Trama315Provision/DS_Trama315Provision";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

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

declare function xf:getSuscriptorData($input_Parameters1 as element(ns2:Input_Parameters))
	{
   let $bestFnFNumbers := $input_Parameters1/SUSCRIPTOR/*:FnF_Numbers
   return
     <ns0:SUSCRIPTOR>
     	<ns0:ISSERVICEACTIVE>{ count( $bestFnFNumbers//* ) >= 1 }</ns0:ISSERVICEACTIVE>
     	<ns0:ELEGIDOS>
     	{ 
	     xf:cargaOriginales($bestFnFNumbers) 
    	}
    	</ns0:ELEGIDOS>
     </ns0:SUSCRIPTOR>	     	
};

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns2:Input_Parameters)){
	(: let $fafID := $input_Parameters1/PARAMETERS/FAFID
	let $elegidosOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafID]/*:DetailNumber
	:)
	let $elegidosOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$input_Parameters1/PARAMETERS/OFERTA]/*:DetailNumber
	return
	<ns0:SUSCRIPTOR>
 		<ns0:ISSERVICEACTIVE>true</ns0:ISSERVICEACTIVE>
		<ns0:ELEGIDOS>{if(count($elegidosOCS)>0) then xf:cargaOriginales($elegidosOCS) else ""}</ns0:ELEGIDOS>
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
    	return <ns0:Detail>{fn:normalize-space($min)}</ns0:Detail>
};

declare function xf:calcularProvisionTrama315_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns1:callFunctionStateless)  {
    <ns1:callFunctionStateless name="DS_Trama315Provision">
            <ns1:parameterList>
               <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                <ns0:MIN_ELEGIDOS>{ xf:cargaElegidos( data($input_Parameters1/MIN_ELEGIDOS) ) }</ns0:MIN_ELEGIDOS>
				<ns0:PARAMETERS>
                   <ns0:OFERTA>{ data($input_Parameters1/PARAMETERS/OFERTA) }</ns0:OFERTA>
                   <ns0:VIGENCIA>{ data($input_Parameters1/PARAMETERS/VIGENCIA) }</ns0:VIGENCIA>
                   <ns0:CODIGO_COBRO>{ data($input_Parameters1/PARAMETERS/CODIGO_COBRO) }</ns0:CODIGO_COBRO>
                   <ns0:CODIGO_ELIMINACION>{ data($input_Parameters1/PARAMETERS/CODIGO_ELIMINACION) }</ns0:CODIGO_ELIMINACION>
                   <ns0:USUARIO_ITEL>{ data($input_Parameters1/PARAMETERS/USUARIO_ITEL) }</ns0:USUARIO_ITEL>
                </ns0:PARAMETERS>
                {xf:getSuscriptorDataOCS($input_Parameters1)}
                <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                <ns0:SERVICIOSEJECUCION />
                <ns0:ERROR>1</ns0:ERROR>
            </ns0:TRAMA_EJECUCION>
        	</ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:calcularProvisionTrama315_Req($input_Parameters1)