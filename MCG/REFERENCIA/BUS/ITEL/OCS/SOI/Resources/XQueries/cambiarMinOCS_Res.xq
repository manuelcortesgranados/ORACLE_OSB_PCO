(:: pragma bea:global-element-parameter parameter="$cambiarMinResponse1" element="ns1:CambiarMinResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CAMBIAR_MIN.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns0 = "http://www.comcel.com.co/CambiarMinOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/cambiarMinOCS_Res/";

declare function xf:cambiarMinOCS_Res($cambiarMinResponse1 as element(ns1:CambiarMinResponse), $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CAMBIAR_MIN exito = "{ data($cambiarMinResponse1/@exito) }"
                             mensaje = "{ data($cambiarMinResponse1/@mensaje) }"/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $cambiarMinResponse1 as element(ns1:CambiarMinResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:cambiarMinOCS_Res($cambiarMinResponse1,
    $codigo,
    $descripcion)