xquery version "1.0" encoding "UTF-8";
(:: pragma  parameter="$MIN" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARREGLASNEGOCIO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_calcularRegNegocioTrama201/";
declare namespace ns0 = "http://www.comcel.com.co/EjecutarReglasNegocio/";

declare function xf:servicioProvision_Req_calcularRegNegocioTrama201($min as xs:string,$metodo as xs:string,
	$in as xs:string,$timeout as xs:string)
    as element(ns0:Input_Parameters) {
    <ns0:Input_Parameters>
        <METODO>{$metodo}</METODO>
		<MIN_DESTINO>{$min}</MIN_DESTINO>
		<MIN_ORIGEN/>
		<IN_DESTINO>{$in}</IN_DESTINO>
		<IN_ORIGEN/>
		<PREFIJO>1-101-57</PREFIJO>
		<CONSECUTIVO/>
		<CONTRATO/>
		<CONTRATOESPOSTPAGO/>
		<CATEGORIA/>
		<CARGAINICIAL/>
		<BLOQUEA/>
		<VIGENCIA/>
		<PARAMETROS_TRAMA>
		<PARAMETRO>
		<NOMBRE>MINORIGEN</NOMBRE>
		<TIPO>string</TIPO>
		<VALOR/>
		</PARAMETRO>
		<PARAMETRO>
		<NOMBRE>COMENTARIO</NOMBRE>
		<TIPO>string</TIPO>
		<VALOR/>
		</PARAMETRO>
		<PARAMETRO>
		<NOMBRE>HOSTID</NOMBRE>
		<TIPO>string</TIPO>
		<VALOR/>
		</PARAMETRO>
		<PARAMETRO>
		<NOMBRE>CONSECUTIVO</NOMBRE>
		<TIPO>string</TIPO>
		<VALOR/>
		</PARAMETRO>
		<PARAMETRO>
		<NOMBRE>MONTORECARGA</NOMBRE>
		<TIPO>decimal</TIPO>
		<VALOR/>
		</PARAMETRO>
		<PARAMETRO>
		<NOMBRE>BONIFICAR</NOMBRE>
		<TIPO>string</TIPO>
		<VALOR/>
		</PARAMETRO>
		<PARAMETRO>
		<NOMBRE>DIASVIGENCIA</NOMBRE>
		<TIPO>decimal</TIPO>
		<VALOR/>
		</PARAMETRO>
		<PARAMETRO>
		<NOMBRE>CUENTASDA</NOMBRE>
		<TIPO>string</TIPO>
		<VALOR></VALOR>
		</PARAMETRO>
		</PARAMETROS_TRAMA>
		<TIEMPO_INICIO></TIEMPO_INICIO>
		<TIMEOUT>{$timeout}</TIMEOUT>
	</ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $metodo as xs:string external;
declare variable $in as xs:string external;
declare variable $timeout as xs:string external;

xf:servicioProvision_Req_calcularRegNegocioTrama201($min,$metodo,$in,$timeout)