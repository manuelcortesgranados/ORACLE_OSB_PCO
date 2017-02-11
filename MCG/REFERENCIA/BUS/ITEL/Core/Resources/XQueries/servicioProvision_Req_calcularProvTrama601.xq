xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$parametrosEntrada" type="xs:anyType" ::)
(:: pragma bea:global-element-parameter parameter="$balancesOCS" element="ns4:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$consultarFaFListResponse" element="ns7:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$datosOCS" element="ns5:WS_Result" location="../../../OCS/SOI/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama601/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA601.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama601/";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama601/";
declare namespace ns4 = "http://www.comcel.com.co/ConsultarBalancesOCS/";
declare namespace ns5 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";
declare namespace ns7 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";

declare function xf:calcularFechaOCS($fechaOCS as xs:string) as xs:string{
	if(fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $fechaOCS) > current-dateTime()) then
		$fechaOCS
	else
		concat(fn-bea:dateTime-to-string-with-format("yyyyMMdd'T'",current-dateTime()),"12:00:00+0000")
};

declare function xf:cuentaVigenteOCS($fechaOCS as xs:string) as xs:boolean{
	if($fechaOCS != '') then(
			if(fn-bea:dateTime-from-string-with-format("yyyyMMdd'T'HH:mm:ss+SSSS", $fechaOCS) > current-dateTime()) then
				xs:boolean('true')
			else
				xs:boolean('false')
	)else (xs:boolean('false'))
};

declare function xf:servicioProvision_Req_calcularProvTrama601($parametrosEntrada as element(*), $codigoIN as xs:string, 
	$categoria as xs:string, $consultarFaFListResponse as element(ns7:WS_Result), $espospago as xs:string, $balancesOCS as element(ns4:WS_Result),
	$datosOCS as element(ns5:WS_Result), $serviceClass as xs:string)
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
       <TRAMA/>
				<METODO>{ data($parametrosEntrada/METODO) }</METODO>
				<MIN>{data($parametrosEntrada/MIN)}</MIN>
				<PARAMETROSTRAMA>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MINORIGEN</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">COMENTARIO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">HOSTID</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">0</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONSECUTIVO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MONTORECARGA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='TMCODE']/VALOR/text())}</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">BONIFICAR</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='SPCODE']/VALOR/text())}</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">DIASVIGENCIA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTRATO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ $serviceClass }</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">METODOCONSECUTIVO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">O</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">STATUS</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">1.0</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">ACC_GRP_ID</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='ACC_GRP_ID']/VALOR/text())}</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">FAFS ELIMINAR</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">
						{ fn:string-join(for $listaElegidos in $consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail 
	                	return if(fn:contains($categoria, fn:tokenize($listaElegidos/fafIndicator,";")[1])) 
	                				then ()
	                				else ( fn:concat(data(fn:tokenize($listaElegidos/fafIndicator,";")[1]),
	                				";",fn:string-join(data($listaElegidos/DetailNumber/fafNumber),";")
		                				)),"|")
		                }</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">FAFS INSTALAR</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">
					{ fn:string-join(for $listaFaFs in fn:tokenize($categoria,";") 
	                	return if(fn:contains($consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST, 
	                				fn:tokenize($listaFaFs,"\|")[1])) 
	                				then ('d')
	                				else (if(fn:contains($consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST, fn:tokenize($listaFaFs,"\|")[2])) then (
	                				 if(not(fn:exists($consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail/DetailNumber/fafNumber))) then () else (
	                				 fn:concat(fn:tokenize($listaFaFs,"\|")[1],";",
	                				fn:string-join(for $listaElegidos in $consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail
	                					where fn:contains($listaElegidos/fafIndicator, fn:tokenize($listaFaFs,"\|")[2])
	                					return (for $i in (1 to xs:integer(fn:tokenize($listaFaFs,"\|")[3])) return 
	                						data($listaElegidos/DetailNumber/fafNumber[$i])),";"))
	                				 )) else())
	                				 ,"|")
		                }</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">PLANES_SPR_RTC</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTR0000000021;100;2</VALOR>
					</PARAMETRO>
				</PARAMETROSTRAMA>
			
				<PARAMETROSNEGOCIO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">ACREDITACUENTA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">FALSE</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MONTOCUENTA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">0</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTRACT</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ $serviceClass }</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CAMBIOSDEPLAN</NOMBRE>
					<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">0</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">ESPOSTPAGO</NOMBRE>
					<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ $espospago }</VALOR>
					</PARAMETRO>	
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">ESUPDOWN</NOMBRE>
					<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSNEGOCIO/PARAMETRO[NOMBRE='ESUPDOWN']/VALOR/text())}</VALOR>
					</PARAMETRO>									
				</PARAMETROSNEGOCIO>
				<SUSCRIPTOR/>
                <SUSCRIPTOR_OCS>
	             	<BALANCES>{ if(number($balancesOCS/MENSAJE/CONSULTAR_BALANCES/MethodResponse/accountValue) > 0
	             			or xf:cuentaVigenteOCS($balancesOCS/MENSAJE/CONSULTAR_BALANCES/MethodResponse/expiryDate))
	             				then (
	             					$balancesOCS/MENSAJE/CONSULTAR_BALANCES/MethodResponse/accountValue, 
	             					<expiryDate>{xf:calcularFechaOCS($balancesOCS/MENSAJE/CONSULTAR_BALANCES/MethodResponse/expiryDate)}</expiryDate>
	             				)else (),
	             				<DedicatedAccounts>{             				
	             				for $balance in $balancesOCS/MENSAJE/CONSULTAR_BALANCES/MethodResponse/DedicatedAccounts/Detail 
	             				where (number($balance/Balance) > 0 or xf:cuentaVigenteOCS($balance/ExpiryDate))
	             				return (<Detail>{
	             					($balance/@*, $balance/node())
	             					}</Detail>
	             				)}</DedicatedAccounts>
	             	}</BALANCES>   
	             	<DATOS_SUSCRIPTOR>{ $datosOCS/MENSAJE/CONSULTAR_SUSCRIPTOR/*:suscriptor /node() }</DATOS_SUSCRIPTOR>                 
                    <FAF_LIST>{ $consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST/node() }</FAF_LIST>
	             	<DATOS_SUSCRIPCION/>                   
                </SUSCRIPTOR_OCS>
				<CODIGOIN>{$codigoIN}</CODIGOIN>
				<TIEMPO>{""}</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $parametrosEntrada as element(*) external;
declare variable $balancesOCS as element(ns4:WS_Result) external;
declare variable $codigoIN as xs:string external;
declare variable $serviceClass as xs:string external;
declare variable $categoria as xs:string external;
declare variable $consultarFaFListResponse as element(ns7:WS_Result) external;
declare variable $espospago as xs:string external;
declare variable $datosOCS as element(ns5:WS_Result) external;


xf:servicioProvision_Req_calcularProvTrama601($parametrosEntrada , $codigoIN, $categoria, $consultarFaFListResponse, $espospago, $balancesOCS, $datosOCS,$serviceClass)