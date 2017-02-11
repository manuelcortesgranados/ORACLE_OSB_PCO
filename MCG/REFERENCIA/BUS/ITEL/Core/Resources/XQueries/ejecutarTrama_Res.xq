(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRespuesta/";
declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Res/";

declare function xf:ejecutarTrama_Res($codigoError as xs:string,
    $respuesta as xs:string,
    $duracion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigoError }</CODIGO>
            <MENSAJE>{ $respuesta }</MENSAJE>
            <DESCRIPCION>{ $duracion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigoError as xs:string external;
declare variable $respuesta as xs:string external;
declare variable $duracion as xs:string external;

xf:ejecutarTrama_Res($codigoError,
    $respuesta,
    $duracion)