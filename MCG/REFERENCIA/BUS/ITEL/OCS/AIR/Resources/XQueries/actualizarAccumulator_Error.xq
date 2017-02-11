xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_ACCUMULATOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/actualizarAccumulator_Error/";
declare namespace ns1 = "http://www.comcel.com.co/ActualizarAccumulatorOCS/";


declare function xf:actualizarAccumulator_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
            	{ $mensaje }
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarAccumulator_Error($codigo,
    $mensaje,
    $descripcion)