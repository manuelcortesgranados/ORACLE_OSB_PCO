xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$parametrosEntrada" type="xs:anyType" ::)
(:: pragma bea:global-element-parameter parameter="$parametros" element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama301/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA301.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama301/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama301/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";

declare function xf:servicioProvision_Req_calcularProvTrama301($parametrosEntrada as element(*), $codigoIN as xs:string, $parametros as element(ns2:WS_Result))
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
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='HOSTID']/VALOR/text())}</VALOR>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONSECUTIVO</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
					</PARAMETRO>
					<PARAMETRO  	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
					<NOMBRE  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MONTORECARGA</NOMBRE>
					<TIPO  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
					<VALOR  	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{ "0" }</VALOR>
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
				<CODIGOIN>{$codigoIN}</CODIGOIN>
				<TIEMPO>{""}</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $parametrosEntrada as element(*) external;
declare variable $codigoIN as xs:string external;
declare variable $parametros as element(ns2:WS_Result) external;

xf:servicioProvision_Req_calcularProvTrama301($parametrosEntrada , $codigoIN, $parametros)