xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$parametosEntrada" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Trama100/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA100.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama100/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama100/";

declare function xf:parametrosTrama($entrada as element(), $sdp as xs:string, $IN as xs:string) as element()
{
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
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">BONIFICAR</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">DIASVIGENCIA</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/"/>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTRATO</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{
			 if ( number($IN) < 51) then
			   data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CONTRATO']/VALOR/text())
			 else
			   data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CONTRACT_TEMPLATE']/VALOR/text())
			 }</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">METODOCONSECUTIVO</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{"N"}</VALOR>
		</PARAMETRO>
		(:DATOS OCS:)
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">TEMPORARY_BLOCKED</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='BLOQUEO']/VALOR/text())}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CONTRACT_TEMPLATE</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CONTRACT_TEMPLATE']/VALOR/text())}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">STATUS</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='STATUS']/VALOR/text())}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">ACC_GRP_ID</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='ACC_GRP_ID']/VALOR/text())}</VALOR>
		</PARAMETRO> 
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">POSPAGO</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='POSTPAGO']/VALOR/text())}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">OFFERID_CARGAINICIAL</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{""}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">FAFID_ELEGIDOS</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{""}</VALOR>
		</PARAMETRO>	
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">SDP</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($sdp)}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">OFFERID_CARGAINICIAL</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='OFFER']/VALOR/text())}</VALOR>
		</PARAMETRO>	
	</PARAMETROSTRAMA>	
};

declare function xf:parametrosNegocio($entrada as element()) as element()
{
    <PARAMETROSNEGOCIO>     
	    <PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CARGAINICIAL</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CARGAINICIAL']/VALOR/text())}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CREACONBLOQUEO</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='BLOQUEO']/VALOR/text())}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CREACONCARGAINICIAL</NOMBRE> (: IF CARGAINICIAL > 0 AND POSTPAGO != TRUE TRUE :)
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{
			   if  (data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='CARGAINICIAL']/VALOR/text()) > 0 and data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='POSTPAGO']/VALOR/text()) != '0') then
			     "TRUE"
			   else("FALSE")
			   
            }</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">CARGADIFERIDA</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">string</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{""}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">MESESADIFERIR</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{""}</VALOR>
		</PARAMETRO>
		<PARAMETRO 	xmlns:con="http://www.comcel.com.co/ConsultarReglasProvision/">
			<NOMBRE 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">VIGENCIA_CARGA</NOMBRE>
			<TIPO 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">decimal</TIPO>
			<VALOR 	xmlns:ejec="http://www.comcel.com.co/Ejecutador/">{data($entrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='VIGENCIA']/VALOR/text())}</VALOR>
		</PARAMETRO>
	</PARAMETROSNEGOCIO>	
};

declare function xf:servicioProvision_Req_calcularProvTrama100($parametosEntrada as element(*), $codigoIN as xs:string, $SDP as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ data($parametosEntrada/TRAMA) }</TRAMA>
            <METODO>{ data($parametosEntrada/METODO) }</METODO>
            <MIN>{ data($parametosEntrada/MIN) }</MIN>
            {
              xf:parametrosTrama($parametosEntrada, $SDP, $codigoIN)
            }
            {
              xf:parametrosNegocio($parametosEntrada)
            }
            <CODIGOIN>{ $codigoIN }</CODIGOIN>
            <TIEMPO>{ "" }</TIEMPO>
        </ns0:Input_Parameters>
};

declare variable $parametosEntrada as element(*) external;
declare variable $codigoIN as xs:string external;
declare variable $SDP as xs:string external;

xf:servicioProvision_Req_calcularProvTrama100($parametosEntrada, $codigoIN, $SDP)