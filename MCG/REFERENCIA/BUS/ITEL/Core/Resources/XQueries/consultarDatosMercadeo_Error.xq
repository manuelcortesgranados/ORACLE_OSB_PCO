(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARDATOSMERCADEO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarDatosMercadeo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarDatosMercadeo_Error/";

declare function xf:consultarDatosMercadeo_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <ns0:CODIGO>{ $codigo }</ns0:CODIGO>
            {
                let $string := $mensaje
                return
                    <ns0:MENSAJE/>
            }
            <ns0:DESCRIPCION>{ $descripcion }</ns0:DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarDatosMercadeo_Error($codigo,
    $mensaje,
    $descripcion)