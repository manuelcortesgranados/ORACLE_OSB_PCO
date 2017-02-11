(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_MODIFICAR_ELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ModificarElegidosRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/ModificarElegidosIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/modificarElegidosIN_Req_ejecutarOperacionIN/";

declare function xf:modificarElegidosIN_Req_ejecutarOperacionIN($input_Parameters as element(ns0:Input_Parameters))
    as element(ns1:ModificarElegidosRequest) {
        <ns1:ModificarElegidosRequest prefijo = "{ data($input_Parameters/PREFIX) }"
                                      min = "{ data($input_Parameters/MIN) }"
                                      diasVigencia = "{ data($input_Parameters/DIAS_VIGENCIA) }"
                                      hostId = "{ data($input_Parameters/USUARIO) }"
                                      requestorId = "{ data($input_Parameters/REQUESTOR_ID) }"
                                      ilimitados = "{ data($input_Parameters/ILIMITADOS) }"
                                      activacion = "{ data($input_Parameters/ACTIVACION) }"
                                      removerTodos = "{ data($input_Parameters/REMOVER_TODOS) }"
                                      in = "{ data($input_Parameters/IN) }"
                                      timeout = "{ data($input_Parameters/TIMEOUT) }">
            <ns1:elegidos>
                {
                    for $Detail in $input_Parameters/ELEGIDOS/*:Detail
                    return
                        <ns1:Detail>{ data($Detail) }</ns1:Detail>
                }
            </ns1:elegidos>
            <ns1:elegidosOriginales>
                {
                    for $Detail in $input_Parameters/ELEGIDOS_ORIGINALES/*:Detail
                    return
                        <ns1:Detail>{ data($Detail) }</ns1:Detail>
                }
            </ns1:elegidosOriginales>
            {
                for $ELEGIDOS_REMOVER in $input_Parameters/ELEGIDOS_REMOVER
                return
                    <ns1:elegidosRemover>
                        {
                            for $Detail in $ELEGIDOS_REMOVER/*:Detail
                            return
                                <ns1:Detail>{ data($Detail) }</ns1:Detail>
                        }
                    </ns1:elegidosRemover>
            }
            {
                for $TIQUETE in $input_Parameters/TIQUETE
                return
                    <ns1:tiquete>{ data($TIQUETE) }</ns1:tiquete>
            }
            <ns1:vigenciaElegidos>{ data($input_Parameters/VIGENCIA_ELEGIDO) }</ns1:vigenciaElegidos>
            <ns1:fechaExpiracionElegidos>{ data($input_Parameters/FECHA_EXPIRACION_ELEGIDO) }</ns1:fechaExpiracionElegidos>
        </ns1:ModificarElegidosRequest>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:modificarElegidosIN_Req_ejecutarOperacionIN($input_Parameters)