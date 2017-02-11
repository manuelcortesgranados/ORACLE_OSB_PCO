(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDACIONGENERAL.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidacionGeneral/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validacionGeneral_Error/";

declare function xf:validacionGeneral_Error($codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:validacionGeneral_Error($codigo,
    $descripcion)