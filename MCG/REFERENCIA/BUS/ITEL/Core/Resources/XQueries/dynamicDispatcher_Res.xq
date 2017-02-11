(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_DYNAMICDISPATCHER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/DynamicDispatcher/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/dynamicDispatcherResponse/";

declare function xf:dynamicDispatcherResponse($codigo as xs:string,
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

xf:dynamicDispatcherResponse($codigo,
    $mensaje,
    $descripcion)