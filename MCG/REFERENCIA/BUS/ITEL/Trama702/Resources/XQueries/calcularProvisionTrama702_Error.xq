xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA702.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama702/Resources/XQueries/calcularProvisionTrama702_Error/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama702/";

declare function xf:calcularProvisionTrama702_Error($codigo as xs:string,
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

declare variable $anyType1 as element(*) external;

xf:calcularProvisionTrama702_Error($codigo,
	$mensaje,
	$descripcion)