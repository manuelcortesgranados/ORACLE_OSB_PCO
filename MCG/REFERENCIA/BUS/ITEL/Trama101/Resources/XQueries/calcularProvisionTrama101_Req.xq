xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA101.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../WSDLs/trama101Provision_DB.wsdl" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama101/Resources/XQueries/calcularProvisionTrama101_Req/";
declare namespace ns2 = "http://xmlns.oracle.com/bpel";
declare namespace ns1 = "http://xmlns.oracle.com/Trama101Provision/Trama101Provision_DF_Trama101Provision";
declare namespace ns3 = "http://www.comcel.com.co/CalcularProvisionTrama101/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

declare function xf:isExpired($fechaString as xs:string)
    as xs:boolean {
    	let $fechaActual := xs:date(substring(xs:string(current-date()), 1, 10))
    	let $fechaCUENTA := xs:date(substring($fechaString, 1, 10))
    	return if ($fechaActual > $fechaCUENTA) then xs:boolean("true") else xs:boolean("false")
};

declare function xf:cargaOffers($offers as xs:string)
{
		let $listaOffers := fn:tokenize($offers,';')
		for $offer in $listaOffers
		return if( string-length(normalize-space($offer))=0)
		then "" 
		else <ns0:Detail>{$offer}</ns0:Detail>
};

declare function xf:offersSize($offers as xs:string) as xs:decimal
{
		let $listaOffers := fn:tokenize($offers,';')
		return fn:count($listaOffers)
};

declare function xf:calcularProvisionTrama101_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="Trama101Provision_DF_Trama101Provision">
          <ns1:parameterList>
          <ns0:TRAMA_EJECUCION>
                <ns0:MIN>{ xs:decimal($input_Parameters1/*:MIN) }</ns0:MIN>
                	{if($input_Parameters1/CODIGOIN<51)then
	                    <ns0:PARAMETROSNEGOCIO>
	                        <ns0:CARGAINICIAL>{xs:decimal( $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[1]/VALOR/text() ) }</ns0:CARGAINICIAL>
	                        <ns0:CREACONBLOQUEO>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[2]/VALOR/text())  then "true" else "false" }</ns0:CREACONBLOQUEO>
	                        <ns0:CREACONCARGAINICIAL>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text())  then "true" else "false" }</ns0:CREACONCARGAINICIAL>
	                        <ns0:CARGADIFERIDA>{ if ("TRUE" =  $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[3]/VALOR/text())  then "true" else "false" }</ns0:CARGADIFERIDA>
	                        <ns0:MESESADIFERIR>{ xs:decimal( $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[5]/VALOR/text() ) }</ns0:MESESADIFERIR>
	                        <ns0:VIGENCIA_CARGA>{ xs:decimal( $input_Parameters1/PARAMETROSNEGOCIO/PARAMETRO[6]/VALOR/text() ) }</ns0:VIGENCIA_CARGA>
	                        <ns0:POSPAGO>{""}</ns0:POSPAGO>
	                    </ns0:PARAMETROSNEGOCIO>
                    else
	                    <ns0:PARAMETROSNEGOCIO>
	                    	<ns0:CARGAINICIAL>{0}</ns0:CARGAINICIAL>
	                        <ns0:CREACONBLOQUEO>{ if ("TRUE" =  $input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='TEMPORARY_BLOCKED']/VALOR/text())  then "true" else "false" }</ns0:CREACONBLOQUEO>
	                        <ns0:CREACONCARGAINICIAL>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='STATUS']/VALOR/text()}</ns0:CREACONCARGAINICIAL>
	                        <ns0:CARGADIFERIDA>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='ACC_GRP_ID']/VALOR/text()}</ns0:CARGADIFERIDA>
	                        <ns0:MESESADIFERIR>{0}</ns0:MESESADIFERIR>
	                        <ns0:VIGENCIA_CARGA>{0}</ns0:VIGENCIA_CARGA>
	                        <ns0:POSPAGO>{if ("TRUE" = $input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='POSPAGO']/VALOR/text())then "true" else "false"}</ns0:POSPAGO>
	                    </ns0:PARAMETROSNEGOCIO>
                    }
                    <ns0:CONTRATO>{ data($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[8]/VALOR) }</ns0:CONTRATO>
                    {if($input_Parameters1/CODIGOIN<51)then
                    	<ns0:INITIALCHARGEOFFER/>
                    else
	                    <ns0:INITIALCHARGEOFFER>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='OFFERID_CARGAINICIAL']/VALOR/text()}</ns0:INITIALCHARGEOFFER>
                    }
                    {if($input_Parameters1/CODIGOIN<51)then
                    	<ns0:FAFOFFERS/>
                    else
                   		<ns0:FAFOFFERS>{if(empty($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFID_ELEGIDOS']/VALOR/text())) then "" else xf:cargaOffers($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFID_ELEGIDOS']/VALOR/text())}</ns0:FAFOFFERS>
                    }
                    {if($input_Parameters1/CODIGOIN<51)then
                    	<ns0:FAFOFFERS_SIZE>0</ns0:FAFOFFERS_SIZE>
                    else
                    	<ns0:FAFOFFERS_SIZE>{if(empty($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFID_ELEGIDOS']/VALOR/text())) then 0 else xf:offersSize($input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='FAFID_ELEGIDOS']/VALOR/text())}</ns0:FAFOFFERS_SIZE>
                    }
                    {if($input_Parameters1/CODIGOIN<51)then
                    	<ns0:SDP/>
                    else
                    	<ns0:SDP>{$input_Parameters1/PARAMETROSTRAMA/PARAMETRO[NOMBRE='SDP']/VALOR/text()}</ns0:SDP>
                    }
                    <ns0:CODIGOPLATAFORMA>{ data($input_Parameters1/*:CODIGOIN) }</ns0:CODIGOPLATAFORMA>                    
                    <ns0:SERVICIOSEJECUCION/>
                    <ns0:ERROR>1</ns0:ERROR>
                </ns0:TRAMA_EJECUCION>
          </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:calcularProvisionTrama101_Req($input_Parameters1)