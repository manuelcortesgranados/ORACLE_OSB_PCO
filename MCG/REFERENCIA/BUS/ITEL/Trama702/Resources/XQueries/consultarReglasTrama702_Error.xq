xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA702.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama702/Resources/XQueries/consultarReglasTrama702_Error/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama702/";

declare function xf:consultarReglasTrama702_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ERROR/>
				<CONSULTASUSCRIPTOR/>
				<FECHA_MODIFICACION_ILIMITADO/>
                <ACREDITACUENTA/>
                <CODIGO_CUENTA/>
                <MONTOCUENTA/>
                <VIGENCIA_ILIMITADO/>
               	<VALIDA_MIN_COMCEL/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarReglasTrama702_Error($codigo,
    $mensaje,
    $descripcion)