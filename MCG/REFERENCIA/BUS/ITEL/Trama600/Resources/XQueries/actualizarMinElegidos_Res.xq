(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZARMINELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ActualizarMinElegidos/";
declare namespace xf = "http://tempuri.org/ITEL/Trama600/Resources/XQueries/actualizarMinElegidos_Res/";

declare function xf:actualizarMinElegidos_Res($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ $mensaje }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarMinElegidos_Res($codigo,
    $mensaje,
    $descripcion)