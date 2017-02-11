(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_MODIFICACION_ELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarModificacionElegidos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarModificacionElegidos_Error/";

declare function xf:consultarModificacionElegidos_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            {
                let $string := $mensaje
                return
                    <MENSAJE/>
            }
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarModificacionElegidos_Error($codigo,
    $mensaje,
    $descripcion)