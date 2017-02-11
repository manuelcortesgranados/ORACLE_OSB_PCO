xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_RENOVAR_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/RenovarElegidosOCS/";
declare namespace ns0 = "http://webapps.online.ericsson.com";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/renovarElegidosOCSOLM_Error/";

declare function xf:renovarElegidosOCSOLM_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <REGISTRO_ELEGIDO>
                    {
                       $mensaje
                    }
                </REGISTRO_ELEGIDO>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:renovarElegidosOCSOLM_Error($codigo,
    $mensaje,
    $descripcion)