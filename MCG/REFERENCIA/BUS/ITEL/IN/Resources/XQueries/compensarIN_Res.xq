(:: pragma bea:global-element-parameter parameter="$compensacionResponse" element="ns0:CompensacionResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_COMPENSAR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarIN_Res/";

declare function xf:compensarIN_Res($compensacionResponse as element(ns0:CompensacionResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Compensacion exito = "{ data($compensacionResponse/@exito) }"
                              mensaje = "{ data($compensacionResponse/@mensaje) }">
                    <ns0:respuesta>{ $compensacionResponse/ns0:respuesta/@* , $compensacionResponse/ns0:respuesta/node() }</ns0:respuesta>
                </Compensacion>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $compensacionResponse as element(ns0:CompensacionResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:compensarIN_Res($compensacionResponse,
    $codigo,
    $descripcion)