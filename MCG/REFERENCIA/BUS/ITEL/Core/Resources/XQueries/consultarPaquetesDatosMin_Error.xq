xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$anyType1" type="xs:anyType" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_DATOS_MIN_PS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatosMin_Error/";
declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesDatosMin/";

declare function xf:consultarPaquetesDatosMin_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <PRODUCTID/>
                <FECHAINICIO/>
                <FECHAFIN/>
                <ESTADO/>
                <SUSCRIPCION/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarPaquetesDatosMin_Error($codigo,
    $mensaje,
    $descripcion)