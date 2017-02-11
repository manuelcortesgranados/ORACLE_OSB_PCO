(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ACTUALIZAR_SALDO_MAYORISTA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ActualizarSaldoMayorista/";
declare namespace xf = "http://tempuri.org/ITEL/RLM/Resources/XQueries/actualizarSaldoMayorista_Err/";

declare function xf:actualizarSaldoMayorista_Err($codigo as xs:string,
    $mensaje as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>{ $mensaje } </MENSAJE>            
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarSaldoMayorista_Err($codigo,
    $mensaje,
    $descripcion)
