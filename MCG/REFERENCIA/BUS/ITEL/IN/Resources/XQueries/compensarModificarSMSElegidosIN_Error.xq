(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_COMPENSAR_MODIFICARSMSELEGIDOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarModificarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarModificarSMSElegidosIN_Error/";

declare function xf:compensarModificarSMSElegidosIN_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Carga exito = "false" mensaje = "{ $mensaje }" />
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:compensarModificarSMSElegidosIN_Error($codigo,
    $mensaje,
    $descripcion)