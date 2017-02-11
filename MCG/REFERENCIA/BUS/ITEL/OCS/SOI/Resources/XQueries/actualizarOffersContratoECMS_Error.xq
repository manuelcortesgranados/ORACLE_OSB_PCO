(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_OFFERS_CONTRACT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ActualizarOffersContratoOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/actualizarOffersContratoECMS_Error/";

declare function xf:actualizarOffersContratoECMS_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ $mensaje }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarOffersContratoECMS_Error($codigo,
    $mensaje,
    $descripcion)