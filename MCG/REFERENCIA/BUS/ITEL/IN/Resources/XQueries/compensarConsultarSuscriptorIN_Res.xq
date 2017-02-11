(:: pragma bea:global-element-parameter parameter="$compensacionResponse1" element="ns0:CompensacionResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_COMPENSAR_CONSULTARSUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarConsultarSuscriptorIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarConsultarSuscriptorIN_Res/";

declare function xf:compensarConsultarSuscriptorIN_Res($compensacionResponse1 as element(ns0:CompensacionResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Compensacion exito = "{ data($compensacionResponse1/@exito) }"
                              mensaje = "{ data($compensacionResponse1/@mensaje) }">
                </Compensacion>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $compensacionResponse1 as element(ns0:CompensacionResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:compensarConsultarSuscriptorIN_Res($compensacionResponse1,
    $codigo,
    $descripcion)