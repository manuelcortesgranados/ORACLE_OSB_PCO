(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR_ECMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CrearSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorECMS_Error/";

declare function xf:crearSuscriptorECMS_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
            	{ $mensaje }
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:crearSuscriptorECMS_Error($codigo,
    $mensaje,
    $descripcion)