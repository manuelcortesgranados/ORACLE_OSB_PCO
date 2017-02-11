xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA705.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama705/Resources/XQueries/consultarReglasTrama705_Error/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama705/";

declare function xf:consultarReglasTrama705_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ERROR/>
				<CONSULTASUSCRIPTOR/>
                <ACREDITACUENTA/>
                <MONTOCUENTA/>
                <CANTIDAD_MENSAJES/>
                <VIGENCIA_MENSAJES/>
               	<VALIDA_MIN_COMCEL/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarReglasTrama705_Error($codigo,
    $mensaje,
    $descripcion)