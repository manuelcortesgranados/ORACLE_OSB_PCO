xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$parametrosEntrada" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama705/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA705.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama705/";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama705/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";

declare function xf:servicioProvision_Req_calcularProvTrama705($parametrosEntrada as element(*), $codigoIN as xs:string, $datosSuscriptor as element(*))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
                <TRAMA/>
				<METODO>{ data($parametrosEntrada/METODO) }</METODO>
				<MIN>{ data($parametrosEntrada/MIN) }</MIN>
				<PARAMETROSTRAMA>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MINORIGEN</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">COMENTARIO</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">HOSTID</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONSECUTIVO</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MONTORECARGA</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">0</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">BONIFICAR</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{""}</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">DIASVIGENCIA</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">0</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTRATO</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">METODOCONSECUTIVO</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{"N"}</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">STATUS</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">NaN</VALOR>
					</PARAMETRO>
				</PARAMETROSTRAMA>
				<PARAMETROSNEGOCIO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">ACREDITACUENTA</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">FALSE</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MONTOCUENTA</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">0</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CANTIDAD_MENSAJES</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CANTIDAD_MENSAJES']/VALOR/text()) }</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">VIGENCIA_MENSAJES</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='VIGENCIA_MENSAJES']/VALOR/text()) }</VALOR>
					</PARAMETRO>
					<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">VALIDA_MIN_COMCEL</NOMBRE>
						<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
						<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">true</VALOR>
					</PARAMETRO>
				</PARAMETROSNEGOCIO>
				<SUSCRIPTOR>
				  {
				    $datosSuscriptor/MENSAJE/DatosDestino/@* , $datosSuscriptor/MENSAJE/DatosDestino/node()
				  }
				</SUSCRIPTOR>
				<SUSCRIPTOR_OCS/>
				<CODIGOIN>{$codigoIN}</CODIGOIN>
				<TIEMPO>{""}</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $parametrosEntrada as element(*) external;
declare variable $codigoIN as xs:string external;
declare variable $datosSuscriptor as element(*) external;

xf:servicioProvision_Req_calcularProvTrama705($parametrosEntrada, $codigoIN, $datosSuscriptor)