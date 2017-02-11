xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$parametrosEntrada" type="xs:anyType" ::)
(:: pragma bea:global-element-parameter parameter="$balancesOCS" element="ns4:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_BALANCES.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$fafListOCS" element="ns7:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$suscripcionOCS" element="ns8:WS_Result" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama600/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA600.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama600/";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama600/";
declare namespace ns4 = "http://www.comcel.com.co/ConsultarBalancesOCS/";
declare namespace ns7 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns8 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";

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

declare function xf:servicioProvision_Req_calcularProvTrama600($parametrosEntrada as element(*), $balancesOCS as element(ns4:WS_Result),
    $fafListOCS as element(ns7:WS_Result), $suscripcionOCS as element(ns8:WS_Result), $sdp as xs:string)
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
       			<TRAMA/>
				<METODO>{ data($parametrosEntrada/METODO) }</METODO>
				<MINORIGEN>{ data($parametrosEntrada/MIN) }</MINORIGEN>
            	<MINDESTINO>{ data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='MINDESTINO']/VALOR/text()) }</MINDESTINO>   
				<PARAMETROSTRAMA>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTRATO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CONTRACT_TEMPLATE']/VALOR/text())}</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">TEMPORARY_BLOCKED</NOMBRE>
					<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">FALSE</VALOR>
					</PARAMETRO>					
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">SDP</NOMBRE>
					<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($sdp)}</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">ACC_GRP_ID</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='ACC_GRP_ID']/VALOR/text())}</VALOR>
					</PARAMETRO>
				</PARAMETROSTRAMA>		
				<PARAMETROSNEGOCIO/>
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
                    <FAF_LIST>{ $fafListOCS/MENSAJE/CONSULTAR_FAFLIST/node() }</FAF_LIST>
	             	<DATOS_SUSCRIPCION>
	             		{
	             			for $offersList in  $suscripcionOCS/MENSAJE/CONSULTAR_SUSCRIPCION/result
	             			where not(fn:contains($offersList,"Elegido"))
	             			return ($offersList/@*, $offersList/node())
	             		}
	             	</DATOS_SUSCRIPCION>                    
                </SUSCRIPTOR_OCS>
				<CODIGOINDORIGEN>51</CODIGOINDORIGEN>
				<CODIGOINDESTINO>51</CODIGOINDESTINO>
				<TIEMPO>{""}</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $parametrosEntrada as element(*) external;
declare variable $balancesOCS as element(ns4:WS_Result) external;
declare variable $fafListOCS as element(ns7:WS_Result) external;
declare variable $suscripcionOCS as element(ns8:WS_Result) external;
declare variable $sdp as xs:string external;

xf:servicioProvision_Req_calcularProvTrama600($parametrosEntrada , $balancesOCS, $fafListOCS, $suscripcionOCS, $sdp )