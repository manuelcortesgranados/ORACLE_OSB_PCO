(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ENRUTADORDINAMICO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EnrutadorDinamico/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/enrutadorDinamicoResponse/";

declare function xf:enrutadorDinamicoResponse($codigo as xs:string,
    $mensaje as element(*),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <Codigo>{ $codigo }</Codigo>
            <Mensaje>{ $mensaje }</Mensaje>
            <Descripcion>{ $descripcion }</Descripcion>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as element(*) external;
declare variable $descripcion as xs:string external;

xf:enrutadorDinamicoResponse($codigo,
    $mensaje,
    $descripcion)