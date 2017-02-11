(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_REGISTRARELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CompensarRegistrarElegidosRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CompensarRegistrarElegidosIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarRegistrarElegidosIN_Req_ejecutarOperacionIN/";

declare function xf:compensarRegistrarElegidosIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CompensarRegistrarElegidosRequest) {
        <ns1:CompensarRegistrarElegidosRequest prefijo = "{ data($input_Parameters1/PREFIX) }"
                                               min = "{ data($input_Parameters1/MIN) }"
                                               diasVigencia = "{ data($input_Parameters1/DIAS_VIGENCIA) }"
                                               hostId = "{ data($input_Parameters1/USUARIO) }"
                                               requestorId = "{ data($input_Parameters1/REQUESTOR_ID) }"
                                               ilimitados = "{ data($input_Parameters1/ILIMITADOS) }"
                                               activacion = "{ data($input_Parameters1/ACTIVACION) }"
                                               in = "{ data($input_Parameters1/IN) }">
            <ns1:elegidos>
                {
                    for $Detail in $input_Parameters1/ELEGIDOS/ns1:Detail
                    return
                        <ns1:Detail>{ data($Detail) }</ns1:Detail>
                }
            </ns1:elegidos>
            <ns1:fechaExpiracionElegidos>{ data($input_Parameters1/FECHA_EXPIRACION_ELEGIDO) }</ns1:fechaExpiracionElegidos>
        </ns1:CompensarRegistrarElegidosRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:compensarRegistrarElegidosIN_Req_ejecutarOperacionIN($input_Parameters1)