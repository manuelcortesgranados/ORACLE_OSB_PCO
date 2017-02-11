xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$parametrosEntrada" type="xs:anyType" ::)
(:: pragma bea:global-element-parameter parameter="$parametros" element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$consultarFaFListResponse" element="ns7:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$suscripcionOCS" element="ns8:WS_Result" location="../../../OCS/OLM/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPCION.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$datosOCS" element="ns5:WS_Result" location="../../../OCS/SOI/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama306/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA306.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama306/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace ns5 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";
declare namespace ns7 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns8 = "http://www.comcel.com.co/ConsultarSuscripcionOCS/";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama306/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";

declare function xf:servicioProvision_Req_calcularProvTrama306($parametrosEntrada as element(*), $codigoIN as xs:string, $parametros as element(ns2:WS_Result),
				$consultarFaFListResponse as element(ns7:WS_Result), $suscripcionOCS as element(ns8:WS_Result),$datosOCS as element(ns5:WS_Result))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
       <TRAMA/>
				<METODO>{ data($parametrosEntrada/METODO) }</METODO>
				<MIN>{data($parametrosEntrada/MIN)}</MIN>
				<MIN_ELEGIDOS>{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR/text())}</MIN_ELEGIDOS>		
				<MIN_ELEGIDOS_FIJOS/>		
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
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONSECUTIVO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MONTORECARGA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='MONTORECARGA']/VALOR/text()) }</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">BONIFICAR</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">DIASVIGENCIA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTRATO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">METODOCONSECUTIVO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">O</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">STATUS</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ "1.0" }</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">PLANES_SPR_RTC</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>					
				</PARAMETROSTRAMA>
                <PARAMETROSNEGOCIO>
                    {
                        for $PARAMETRO in $parametros/MENSAJE/PARAMETROS/PARAMETRO
                        return
							<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
							<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ data($PARAMETRO/NOMBRE) }</NOMBRE>
							<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ data($PARAMETRO/TIPO) }</TIPO>
							<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ data($PARAMETRO/VALOR) }</VALOR>
							</PARAMETRO>                        
                    }
                </PARAMETROSNEGOCIO>				
				<SUSCRIPTOR />
                <SUSCRIPTOR_OCS>
	             	<BALANCES/>   
	             	<DATOS_SUSCRIPTOR>{ $datosOCS/MENSAJE/CONSULTAR_SUSCRIPTOR/*:suscriptor /node() }</DATOS_SUSCRIPTOR> 
	             	<DATOS_CONTRATO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/" xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
						<CONTRATO/>
						<PROVIDER/>
						<TARIFF/>
					</DATOS_CONTRATO>
                    <FAF_LIST>{ $consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST/node() }</FAF_LIST>
	             	<DATOS_SUSCRIPCION>{ $suscripcionOCS/MENSAJE/CONSULTAR_SUSCRIPCION/node() }</DATOS_SUSCRIPCION>               
                </SUSCRIPTOR_OCS>				
				<CODIGOIN>{$codigoIN}</CODIGOIN>
				<TIEMPO>{""}</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $parametrosEntrada as element(*) external;
declare variable $codigoIN as xs:string external;
declare variable $parametros as element(ns2:WS_Result) external;
declare variable $consultarFaFListResponse as element(ns7:WS_Result) external;
declare variable $suscripcionOCS as element(ns8:WS_Result) external;
declare variable $datosOCS as element(ns5:WS_Result) external;

xf:servicioProvision_Req_calcularProvTrama306($parametrosEntrada , $codigoIN, $parametros, $consultarFaFListResponse, $suscripcionOCS, $datosOCS)