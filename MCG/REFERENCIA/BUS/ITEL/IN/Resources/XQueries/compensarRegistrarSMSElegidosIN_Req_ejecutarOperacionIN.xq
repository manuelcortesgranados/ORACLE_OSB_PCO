(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_REGISTRARSMSELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CompensarRegistrarSMSElegidosRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarRegistrarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/registrarSMSElegidosIN_Req_ejecutarOperacionIN/";

declare function xf:registrarSMSElegidosIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:CompensarRegistrarSMSElegidosRequest) {
        <ns0:CompensarRegistrarSMSElegidosRequest cuenta = "{ data($input_Parameters/CUENTA) }"
                                                  prefijo = "{ data($input_Parameters/PREFIJO) }"
                                                  min = "{ data($input_Parameters/MIN) }"
                                                  diasVigencia = "{ data($input_Parameters/DIAS_VIGENCIA) }"
                                                  hostId = "{ data($input_Parameters/USUARIO) }"
                                                  requestorId = "{ data($input_Parameters/REQUESTOR_ID) }"
                                                  activacion = "{ data($input_Parameters/ACTIVACION) }"
                                                  in = "{ data($input_Parameters/IN) }">
            <ns0:elegidos>
                {
                    for $Detail in $input_Parameters/ELEGIDOS/ns0:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidos>
            <ns0:fechaExpiracionElegidos>{ data($input_Parameters/FECHA_EXPIRACION_ELEGIDOS) }</ns0:fechaExpiracionElegidos>
        </ns0:CompensarRegistrarSMSElegidosRequest>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:registrarSMSElegidosIN_Req_ejecutarOperacionIN($input_Parameters)