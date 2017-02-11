(:: pragma bea:global-element-parameter parameter="$cargarResponse" element="ns0:CargarResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CARGAR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CargarIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/cargarIN_Res/";

declare function xf:cargarIN_Res($cargarResponse as element(ns0:CargarResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Carga exito = "{ data($cargarResponse/@exito) }"
                       mensaje = "{ data($cargarResponse/@mensaje) }"
                       cluster = "{ data($cargarResponse/@cluster) }">
                    <ns0:respuesta>{ $cargarResponse/ns0:respuesta/@* , $cargarResponse/ns0:respuesta/node() }</ns0:respuesta>
                </Carga>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $cargarResponse as element(ns0:CargarResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:cargarIN_Res($cargarResponse,
    $codigo,
    $descripcion)