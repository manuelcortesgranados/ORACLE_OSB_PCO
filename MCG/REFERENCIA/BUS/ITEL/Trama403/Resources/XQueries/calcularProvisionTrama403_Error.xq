(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA403.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama403/";
declare namespace xf = "http://tempuri.org/ITEL/Trama403/Resources/XQueries/consultarReglasProvisionTrama403_Error/";

declare function xf:consultarReglasProvisionTrama403_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE />
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarReglasProvisionTrama403_Error($codigo,
    $mensaje,
    $descripcion)