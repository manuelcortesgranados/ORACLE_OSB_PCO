xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$compensacionResponse1" element="ns1:CompensacionResponse" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_COMPENSAR_MODIFICARELEGIDOS_FIJOS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarModificarElegidosFijoIN_Res/";
declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CompensarModificarElegidosFijosIN/";

declare function xf:compensarModificarElegidosFijoIN_Res($compensacionResponse1 as element(ns1:CompensacionResponse),$codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <Compensacion exito = "{ data($compensacionResponse1/@exito) }"
                              mensaje = "{ data($compensacionResponse1/@mensaje) }">
                </Compensacion>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>    
};

declare variable $compensacionResponse1 as element(ns1:CompensacionResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:compensarModificarElegidosFijoIN_Res($compensacionResponse1,
									     $codigo,
									     $descripcion)