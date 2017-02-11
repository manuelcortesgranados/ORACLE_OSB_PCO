xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_COMPENSAR_CREARSUSCRIPTOR.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarCrearSuscriptorIN_Error/";
declare namespace ns1 = "http://www.comcel.com.co/CompensarCrearSuscriptorIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";

declare function xf:compensarCrearSuscriptorIN_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Compensacion exito = "false" mensaje = "{ $mensaje }" />
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:compensarCrearSuscriptorIN_Error($codigo,
    $mensaje,
    $descripcion)