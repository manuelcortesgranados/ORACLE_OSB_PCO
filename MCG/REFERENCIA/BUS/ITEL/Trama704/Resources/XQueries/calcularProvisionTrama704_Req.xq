(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA704.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../WSDLs/trama704Provision_DB.wsdl" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama704Provision/Trama704Provision_DF_Trama704Provision";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama704/";
declare namespace xf = "http://tempuri.org/ITEL/Trama704/Resources/XQueries/calcularProvisionTrama704_Req/";

declare function xf:cargaElegidos($elegidos as xs:string)
 {
    	let $listaElegidos := fn:tokenize($elegidos,';')
    	for $min in $listaElegidos
    	return <ns1:Detail>{$min}</ns1:Detail>
};

declare function xf:cargaOriginales($elegidos as element())
{
    	for $elegido in $elegidos/*
    	return <ns1:Detail>{data($elegido)}</ns1:Detail>
};

declare function xf:getSuscriptorDataOCS($input_Parameters1 as element(ns0:Input_Parameters)){
	let $fafID := data($input_Parameters1/PARAMETERS/FAFID)
	let $elegidosOCS := $input_Parameters1/SUSCRIPTOR_OCS/FAF_LIST/*:fafInformationList/*:Detail[*:fafIndicator=$fafID]/*:DetailNumber
	return
	<ns1:SUSCRIPTOR>
		<ns1:ISSERVICEACTIVE>{count ($elegidosOCS/*) >0}</ns1:ISSERVICEACTIVE>
		<ns1:ELEGIDOS>{if(count($elegidosOCS)>0) then xf:cargaOriginales($elegidosOCS) else ""}</ns1:ELEGIDOS>
		<ns1:VIGENCIA_ELEGIDO></ns1:VIGENCIA_ELEGIDO>
		<ns1:FECHA_CREACION_ELEGIDO></ns1:FECHA_CREACION_ELEGIDO>
		<ns1:FECHA_EXPIRACION_ELEGIDO></ns1:FECHA_EXPIRACION_ELEGIDO>
		<ns1:SUSCRIPCION_ELEGIDO></ns1:SUSCRIPCION_ELEGIDO>
 	</ns1:SUSCRIPTOR>
};

declare function xf:getSuscriptorData($input_Parameters1 as element(ns0:Input_Parameters))
	{
   let $SMSOnNet_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSOnNet_Numbers
   let $SMSOffNet_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSOffNet_Numbers
   let $SMSAny_Numbers := $input_Parameters1/SUSCRIPTOR/*:SMSAny_Numbers
   let $codCuenta := data($input_Parameters1/PARAMETERS/CODIGO_CUENTA)
   let $vigenciaElegido := data($input_Parameters1/SUSCRIPTOR/*:VIGENCIA_ELEGIDO)
   let $fechaCreacionElegido := data($input_Parameters1/SUSCRIPTOR/*:FECHA_CREACION_ELEGIDO)
   let $fechaExpiracionElegido := data($input_Parameters1/SUSCRIPTOR/*:FECHA_EXPIRACION_ELEGIDO)
   let $suscripcion := data($input_Parameters1/SUSCRIPTOR/*:SUSCRIPCION_ELEGIDO)
   return
     <ns1:SUSCRIPTOR>
     	<ns1:ISSERVICEACTIVE>{ count( $SMSOnNet_Numbers//* ) >= 1 or count( $SMSOffNet_Numbers//* ) >= 1  or count( $SMSAny_Numbers//* ) >= 1}</ns1:ISSERVICEACTIVE>
     	<ns1:ELEGIDOS>
     	{
     		if ($codCuenta=0) then xf:cargaOriginales($SMSOnNet_Numbers) else 
			if ($codCuenta=1) then xf:cargaOriginales($SMSOffNet_Numbers) else 
			if ($codCuenta=2) then xf:cargaOriginales($SMSAny_Numbers) else ""
     	}
    	</ns1:ELEGIDOS>
    	<ns1:VIGENCIA_ELEGIDO>{$vigenciaElegido}</ns1:VIGENCIA_ELEGIDO>
     	<ns1:FECHA_CREACION_ELEGIDO>{$fechaCreacionElegido}</ns1:FECHA_CREACION_ELEGIDO>
     	<ns1:FECHA_EXPIRACION_ELEGIDO>{$fechaExpiracionElegido}</ns1:FECHA_EXPIRACION_ELEGIDO>
     	<ns1:SUSCRIPCION_ELEGIDO>{$suscripcion}</ns1:SUSCRIPCION_ELEGIDO>
     </ns1:SUSCRIPTOR>	     	
};

declare function xf:calcularProvisionTrama704_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless>
            <ns2:parameterList>
                <ns1:TRAMA_EJECUCION>
                    <ns1:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns1:MIN>
                    <ns1:MIN_ELEGIDOS>{ xf:cargaElegidos( data($input_Parameters1/MIN_ELEGIDOS) ) }</ns1:MIN_ELEGIDOS>
                    {if($input_Parameters1/CODIGOIN < 51) then
                    <ns1:PARAMETERS>
                        <ns1:CODIGO_CUENTA>{ data($input_Parameters1/PARAMETERS/CODIGO_CUENTA) }</ns1:CODIGO_CUENTA>
                        <ns1:TIPO_ELIMINACION>{ data($input_Parameters1/PARAMETERS/TIPO_ELIMINACION) }</ns1:TIPO_ELIMINACION>
                        <ns1:ELIMINAR_TODOS>{ data($input_Parameters1/PARAMETERS/ELIMINAR_TODOS) }</ns1:ELIMINAR_TODOS>
                        <ns1:USUARIO_ITEL>{ data($input_Parameters1/PARAMETERS/USUARIO_ITEL) }</ns1:USUARIO_ITEL>
                    </ns1:PARAMETERS>
                    else
                    <ns1:PARAMETERS>
                        <ns1:CODIGO_CUENTA>{ data($input_Parameters1/PARAMETERS/CODIGO_CUENTA) }</ns1:CODIGO_CUENTA>
                        <ns1:TIPO_ELIMINACION>{ "active" }</ns1:TIPO_ELIMINACION>
                        <ns1:ELIMINAR_TODOS>{ data($input_Parameters1/PARAMETERS/ELIMINAR_TODOS) }</ns1:ELIMINAR_TODOS>
                        <ns1:USUARIO_ITEL>{ data($input_Parameters1/PARAMETERS/FAFID) }</ns1:USUARIO_ITEL>
                    </ns1:PARAMETERS>
                    }
                   {
	                if( $input_Parameters1/CODIGOIN < 51 ) then
	                xf:getSuscriptorData($input_Parameters1)
	                else
					xf:getSuscriptorDataOCS($input_Parameters1) 	                
	                }
                    <ns1:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns1:CODIGOPLATAFORMA>
                    <ns1:SERVICIOSEJECUCION />
                    <ns1:ERROR>1</ns1:ERROR>
                </ns1:TRAMA_EJECUCION>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:calcularProvisionTrama704_Req($input_Parameters1)