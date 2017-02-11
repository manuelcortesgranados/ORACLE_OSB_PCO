(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_COMPENSAR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarIN_Error/";

declare function xf:compensarIN_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Compensacion exito = "false" mensaje = "{ $mensaje }" />
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:compensarIN_Error($codigo,
    $mensaje,
    $descripcion)