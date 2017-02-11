(:: pragma bea:global-element-parameter parameter="$dsmnResponse1" element="ns1:dsmnResponse" location="../Schemas/DA_ITEL_OPERACION_PROVISION_OLM.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ELIMINAR_ELEGIDOS.xsd" ::)

declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/EliminarElegidosOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/eliminarElegidosOCS_Res/";

declare function xf:eliminarElegidosOCS_Res(
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>                
                <ELIMINAR_ELEGIDOS></ELIMINAR_ELEGIDOS>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:eliminarElegidosOCS_Res(
    $codigo,
    $descripcion)