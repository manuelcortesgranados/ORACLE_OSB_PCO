(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_CONSULTAR_PAQUETES_DATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARPAQUETESDATOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_PAQUETES_DATOS/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarNRN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatos_Error/";

declare function xf:consultarPaquetesDatos_Error($codigo as xs:string,
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


xf:consultarPaquetesDatos_Error($codigo,
    $mensaje,
    $descripcion)