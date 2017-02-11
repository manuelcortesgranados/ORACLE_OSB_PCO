(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_UCyUT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionTypes";
declare namespace ns2 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarUCyUTOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/consultarUCyUT_Error/";

declare function xf:consultarUCyUT_Error($codigo as xs:string,
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

xf:consultarUCyUT_Error($codigo,
    $mensaje,
    $descripcion)
