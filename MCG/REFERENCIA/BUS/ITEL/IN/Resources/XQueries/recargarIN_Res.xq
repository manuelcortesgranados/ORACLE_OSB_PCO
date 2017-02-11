(:: pragma bea:global-element-parameter parameter="$recargarResponse" element="ns1:RecargarResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_RECARGAR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/RecargarIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/recargarIN_Res/";

declare function xf:recargarIN_Res($recargarResponse as element(ns1:RecargarResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Recarga exito = "{ data($recargarResponse/@exito) }"
                         mensaje = "{ data($recargarResponse/@mensaje) }"
                         cluster = "{ data($recargarResponse/@cluster) }">
                    <ns1:respuesta>{ $recargarResponse/ns1:respuesta/@* , $recargarResponse/ns1:respuesta/node() }</ns1:respuesta>
                </Recarga>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $recargarResponse as element(ns1:RecargarResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:recargarIN_Res($recargarResponse,
    $codigo,
    $descripcion)