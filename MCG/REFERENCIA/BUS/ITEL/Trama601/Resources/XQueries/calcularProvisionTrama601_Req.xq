xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA601.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama601Provision_DB.wsdl" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama601/Resources/XQueries/calcularProvisionTrama601_Req/";
declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/Trama601Provision/Trama601Provision_DF_Trama601Provision";
declare namespace ns3 = "http://www.comcel.com.co/CalcularProvisionTrama601/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:dateFromISO8601($isoDate as xs:string){
	let $fechaFormato := concat( substring($isoDate, 1, 4), "-", substring($isoDate, 5, 2), "-", substring($isoDate, 7, 2) )
	return $fechaFormato
};

declare function xf:obtenerListas($string as xs:string, $registro as xs:boolean){
	let $listas := fn:tokenize($string,'\|')
	for $lista in $listas
	return
		let $elegidos := fn:tokenize($lista,';')
		return
			if($registro and count($elegidos)<2) then ""
			else
			<ns0:FAFLIST>
				<ns0:FAFID>{$elegidos[1]}</ns0:FAFID>
				<ns0:ELEGIDOS>
				{
					for $elegido in $elegidos
					return
						if ($elegido=$elegidos[1]) then "" 
						else
							<ns0:Detail>{$elegido}</ns0:Detail> 
				} 
				</ns0:ELEGIDOS>
			</ns0:FAFLIST>
};

declare function xf:calcularProvisionTrama601_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
    	let $lists := if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFS INSTALAR']/VALOR/text()!="") then xf:obtenerListas($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFS INSTALAR']/VALOR/text(),xs:boolean("true")) else ()
    	let $listsRemove := if ($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFS ELIMINAR']/VALOR/text()) then xf:obtenerListas($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFS ELIMINAR']/VALOR/text(),xs:boolean("false")) else ()
    	return
        <ns1:callFunctionStateless name="Trama601Provision_DF_Trama601Provision">
          <ns1:parameterList>
          <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/MIN) }</ns0:MIN>
                    <ns0:PARAMETROSNEGOCIO>
                        <ns0:ACREDITACUENTA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text())  then "true" else "false" }</ns0:ACREDITACUENTA>
                        <ns0:MONTOCUENTA>{ if (fn:empty($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())) then xs:decimal("0") else xs:decimal($input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR) }</ns0:MONTOCUENTA>
                        <ns0:CONTRACT>{ if($input_Parameters1/CODIGOIN < 51) then $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text() else $input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='CONTRATO']/VALOR/text() }</ns0:CONTRACT>
                        <ns0:ESPOSTPAGO>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ESPOSTPAGO']/VALOR/text()}</ns0:ESPOSTPAGO>
                        <ns0:ESUPDOWN>{$input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ESUPDOWN']/VALOR/text()}</ns0:ESUPDOWN>
                    </ns0:PARAMETROSNEGOCIO>
                    {if($input_Parameters1/CODIGOIN < 51) then
                    <ns0:SUSCRIPTOR>
                        <ns0:ISEXPIREDONPEAK>{ xf:isExpired(data($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:ExpiryDate)) }</ns0:ISEXPIREDONPEAK>
                        <ns0:ONPEAKBALANCE>{ xs:decimal($input_Parameters1/SUSCRIPTOR/*:OnPeakAccountID/*:Balance) }</ns0:ONPEAKBALANCE>
                        <ns0:PLAN>{ data($input_Parameters1/SUSCRIPTOR/*:Contract) }</ns0:PLAN>
                        <ns0:FAFLISTS>
                        	<ns0:SIZE>0</ns0:SIZE>
                        </ns0:FAFLISTS>
                        <ns0:FAFLISTSREMOVE>
                        	<ns0:SIZE>0</ns0:SIZE>
                        </ns0:FAFLISTSREMOVE>
                        <ns0:CHOSENSIZE>0</ns0:CHOSENSIZE>
                    </ns0:SUSCRIPTOR>
                    else
                    <ns0:SUSCRIPTOR>
                        <ns0:ISEXPIREDONPEAK>{if(data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:expiryDate) != '') then xf:isExpired(xf:dateFromISO8601( data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:expiryDate ))) else 'false'}</ns0:ISEXPIREDONPEAK>
                        <ns0:ONPEAKBALANCE>{if (data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:accountValue) != '' ) then data($input_Parameters1/SUSCRIPTOR_OCS/BALANCES/*:accountValue) else '0'  }</ns0:ONPEAKBALANCE>
                        <ns0:PLAN>{data($input_Parameters1/SUSCRIPTOR_OCS/DATOS_SUSCRIPTOR/*:PublicRatePlanCode)}</ns0:PLAN>
                        <ns0:FAFLISTS>
                        	<ns0:SIZE>{count($lists[string(.)])}</ns0:SIZE>
                        	{$lists}
                        </ns0:FAFLISTS>
                        <ns0:FAFLISTSREMOVE>
                        	<ns0:SIZE>{count($listsRemove)}</ns0:SIZE>
                        	{$listsRemove}
                        </ns0:FAFLISTSREMOVE>
                        <ns0:CHOSENSIZE>0</ns0:CHOSENSIZE>
                    </ns0:SUSCRIPTOR>
                    }
                    <ns0:ACC_GRP_ID>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='ACC_GRP_ID']/VALOR/text()}</ns0:ACC_GRP_ID>
                    <ns0:CANTIDAD_CAMBIOS_PLAN>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='CAMBIOSDEPLAN']/VALOR/text()}</ns0:CANTIDAD_CAMBIOS_PLAN>
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/CODIGOIN) }</ns0:CODIGOPLATAFORMA>
                    <ns0:SERVICIOSEJECUCION/>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
          </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:calcularProvisionTrama601_Req($input_Parameters1)