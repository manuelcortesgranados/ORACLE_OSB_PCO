xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$bloqueoOtro" type="xs:anyType" ::)
(:: pragma  parameter="$bloqueoFraude" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Trama602/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA602.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama602/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama602/";

declare function xf:servicioProvision_Req_calcularProvTrama602($parametrosEntrada as element(*), $codigoIN as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
       			<TRAMA/>
				<METODO>{ data($parametrosEntrada/METODO) }</METODO>
				<MIN>{data($parametrosEntrada/MIN)}</MIN>
				<PARAMETROSTRAMA>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MONTORECARGA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='FLAG_FRAUDE']/VALOR/text())}</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">BONIFICAR</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='FLAG_BLOQUEO']/VALOR/text())}</VALOR>
					</PARAMETRO>
				</PARAMETROSTRAMA>
			
				<PARAMETROSNEGOCIO/>
				<SUSCRIPTOR>
				 	<IsLocked>FALSE</IsLocked>
				 	<IsFraudLocked>FALSE</IsFraudLocked>
				</SUSCRIPTOR>
				<SUSCRIPTOR_OCS/>
				<CODIGOIN>{$codigoIN}</CODIGOIN>
				<TIEMPO>{""}</TIEMPO>
			</ns0:Input_Parameters>
};

declare variable $parametrosEntrada as element(*) external;
declare variable $codigoIN as xs:string external;

xf:servicioProvision_Req_calcularProvTrama602($parametrosEntrada, $codigoIN)