(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_REGISTRO_PAQUETESBB.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/registroPaquetesBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/registroPaquetesBB_Error/";

declare function xf:registroPaquetesBB_Error($codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <RESULTADO/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:registroPaquetesBB_Error($codigo,
    $descripcion)
