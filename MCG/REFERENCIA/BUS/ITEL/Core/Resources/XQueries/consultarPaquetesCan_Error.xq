(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_PAQUETESCAN_BB.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesCanBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesCan_Error/";

declare function xf:consultarPaquetesCan_Error($codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <ACTIVO/>
                <ANIDADO/>
                <RESULTADO/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarPaquetesCan_Error($codigo,
    $descripcion)
