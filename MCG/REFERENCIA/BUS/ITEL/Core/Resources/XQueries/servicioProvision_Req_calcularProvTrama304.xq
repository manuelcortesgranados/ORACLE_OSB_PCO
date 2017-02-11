xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$parametrosEntrada" type="xs:anyType" ::)
(:: pragma bea:global-element-parameter parameter="$parametros" element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLAS.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$consultarFaFListResponse" element="ns7:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$datosOCS" element="ns5:WS_Result" location="../../../OCS/SOI/Resources/Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../../../Trama304/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA304.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularProvTrama304/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglas/";
declare namespace ns5 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";
declare namespace ns7 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama304/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";

declare function xf:servicioProvision_Req_calcularProvTrama304($parametrosEntrada as element(*), $codigoIN as xs:string, $parametros as element(ns2:WS_Result),
				$consultarFaFListResponse as element(ns7:WS_Result), $datosOCS as element(ns5:WS_Result))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
       <TRAMA/>
				<METODO>{ data($parametrosEntrada/METODO) }</METODO>
				<MIN>{data($parametrosEntrada/MIN)}</MIN>
				<MIN_ELEGIDOS>{data($parametrosEntrada/PARAMETROSPROVISION/PARAMETRO[NOMBRE='HOSTID']/VALOR/text())}</MIN_ELEGIDOS>				
				<PARAMETERS>
					<TIPO_ELIMINACION/>
					<ELIMINAR_TODOS/>
					<USUARIO_ITEL>{ "AprovPrep" }</USUARIO_ITEL>
					<FAFID>{ data($parametros/MENSAJE/PARAMETROS/PARAMETRO[NOMBRE='FAFID']/VALOR) }</FAFID>
				</PARAMETERS>		
				<SUSCRIPTOR />
                <SUSCRIPTOR_OCS>
	             	<BALANCES/>   
	             	<DATOS_SUSCRIPTOR>{ $datosOCS/MENSAJE/CONSULTAR_SUSCRIPTOR/*:suscriptor /node() }</DATOS_SUSCRIPTOR>                 
                    <FAF_LIST>{ $consultarFaFListResponse/MENSAJE/CONSULTAR_FAFLIST/node() }</FAF_LIST>
	             	<DATOS_SUSCRIPCION/>                   
                </SUSCRIPTOR_OCS>				
				<CODIGOIN>{$codigoIN}</CODIGOIN>
				<TIEMPO>{""}</TIEMPO>
        </ns1:Input_Parameters>
};

declare variable $parametrosEntrada as element(*) external;
declare variable $codigoIN as xs:string external;
declare variable $parametros as element(ns2:WS_Result) external;
declare variable $consultarFaFListResponse as element(ns7:WS_Result) external;
declare variable $datosOCS as element(ns5:WS_Result) external;

xf:servicioProvision_Req_calcularProvTrama304($parametrosEntrada , $codigoIN, $parametros, $consultarFaFListResponse, $datosOCS)