(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_DYNAMICDISPATCHER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/DynamicDispatcher/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/dynamicDispatcherError/";

declare function xf:dynamicDispatcherError($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <Codigo>{ $codigo }</Codigo>
            <Mensaje>{ $mensaje }</Mensaje>
            <Descripcion>{ $descripcion }</Descripcion>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:dynamicDispatcherError($codigo,
    $mensaje,
    $descripcion)