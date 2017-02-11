(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CARGAR_WSUN.xsd" ::)

declare namespace nsn = "http://nsn.com/ossbss/charge.once/wsdl/entity/Tis/xsd/1";
declare namespace ns0 = "http://www.comcel.com.co/CargarWSUN/";
declare namespace xf = "http://tempuri.org/ITEL/UN/Resources/XQueries/cargarWSUN_Error/";

declare function xf:cargarWSUN_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ $mensaje }</MENSAJE>
            <DESCRIPCION>{ concat($descripcion , fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:cargarWSUN_Error($codigo,
    $mensaje,
    $descripcion,
    $tiempoI)