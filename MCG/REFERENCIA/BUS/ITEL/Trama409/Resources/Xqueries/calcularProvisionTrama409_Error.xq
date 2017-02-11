xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA409.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama409/Resources/XQueries/calcularProvisionTrama409_Error/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama409/";

declare function xf:calcularProvisionTrama409_Error($codigo as xs:string,
	$mensaje as xs:string,
	$descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{$codigo}</CODIGO>
        	<MENSAJE/>
        	<DESCRIPCION>{$descripcion}</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:calcularProvisionTrama409_Error($codigo,
	$mensaje,
	$descripcion)