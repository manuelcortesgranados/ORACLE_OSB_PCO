(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_MERCADEO_OCS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarMercadeoOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarMercadeoOCS_Error/";

declare function xf:consultarMercadeoOCS_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string) as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ $mensaje } </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarMercadeoOCS_Error($codigo,
    $mensaje,
    $descripcion)