xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA309.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama309/Resources/XQueries/consultarReglasTrama309_Error/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama309/";

declare function xf:consultarReglasTrama309_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ERROR/>
				<CONSULTASUSCRIPTOR/>
				<FECHA_REGISTRO_ILIMITADO/>
                <ACREDITACUENTA/>
                <MONTOCUENTA/>
                <VIGENCIA_ILIMITADO/>
               	<VIGENCIA_ILIMITADO_MESES/>
               	<VALIDA_MIN_COMCEL/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarReglasTrama309_Error($codigo,
    $mensaje,
    $descripcion)