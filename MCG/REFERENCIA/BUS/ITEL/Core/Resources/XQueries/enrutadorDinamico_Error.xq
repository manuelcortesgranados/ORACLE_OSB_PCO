(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ENRUTADORDINAMICO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EnrutadorDinamico/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/enrutadorDinamico_Error/";

declare function xf:enrutadorDinamico_Error($codigo as xs:string,
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>Error</MENSAJE>
            <DESCRIPCION>{ concat($descripcion , fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:enrutadorDinamico_Error($codigo,
    $descripcion,
    $tiempoI)