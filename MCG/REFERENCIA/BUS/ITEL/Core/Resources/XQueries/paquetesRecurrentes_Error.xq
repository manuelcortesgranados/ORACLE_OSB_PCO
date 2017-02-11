(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_PAQUETESRECURRENTES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_PAQUETESRECURRENTES.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_paquetesRecurrentes";
declare namespace ns0 = "http://www.comcel.com.co/PaquetesRecurrentes/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/paquetesRecurrentes_Error/";

declare function xf:consultarPaquetes_Error($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                { $mensaje }
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;


xf:consultarPaquetes_Error($codigo,
    $mensaje,
    $descripcion)