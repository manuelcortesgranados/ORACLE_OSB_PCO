(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_REGISTRAR_ELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:RegistrarElegidosRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/RegistrarElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/registrarElegidosIN_Req_ejecutarOperacionIN/";

declare function xf:registrarElegidosIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:RegistrarElegidosRequest) {
        <ns0:RegistrarElegidosRequest prefijo = "{ data($input_Parameters/PREFIX) }"
                                      min = "{ data($input_Parameters/MIN) }"
                                      diasVigencia = "{ data($input_Parameters/DIAS_VIGENCIA) }"
                                      hostId = "{ data($input_Parameters/USUARIO) }"
                                      requestorId = "{ data($input_Parameters/REQUESTOR_ID) }"
                                      ilimitados = "{ data($input_Parameters/ILIMITADOS) }"
                                      activacion = "{ data($input_Parameters/ACTIVACION) }"
                                      in = "{ data($input_Parameters/IN) }"
                                      timeout = "{ data($input_Parameters/TIMEOUT) }">
            <ns0:elegidos>
                {
                    for $Detail in $input_Parameters/ELEGIDOS/ns0:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidos>
            <ns0:vigenciaElegidos>{ data($input_Parameters/VIGENCIA_ELEGIDO) }</ns0:vigenciaElegidos>
            <ns0:fechaExpiracionElegidos>{ data($input_Parameters/FECHA_EXPIRACION_ELEGIDO) }</ns0:fechaExpiracionElegidos>
        </ns0:RegistrarElegidosRequest>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:registrarElegidosIN_Req_ejecutarOperacionIN($input_Parameters)