(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_MODIFICAR_SMSELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:EliminarSMSElegidosRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/EliminarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/eliminarSMSElegidosIN_Req_ejecutarOperacionIN/";

declare function xf:eliminarSMSElegidosIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:EliminarSMSElegidosRequest) {
        <ns0:EliminarSMSElegidosRequest cuenta = "{ data($input_Parameters/CUENTA) }"
                                         prefijo = "{ data($input_Parameters/PREFIJO) }"
                                         min = "{ data($input_Parameters/MIN) }"
                                         diasVigencia = "{ data($input_Parameters/DIAS_VIGENCIA) }"
                                         hostId = "{ data($input_Parameters/USUARIO) }"
                                         requestorId = "{ data($input_Parameters/REQUESTOR_ID) }"
                                         activacion = "{ data($input_Parameters/ACTIVACION) }"
                                         removerTodos = "{ data($input_Parameters/REMOVER_TODOS) }"
                                         in = "{ data($input_Parameters/IN) }"
                                         timeout = "{ data($input_Parameters/TIMEOUT) }">
            <ns0:elegidos>
                {
                    for $Detail in $input_Parameters/ELEGIDOS/*:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidos>
            <ns0:elegidosOriginales>
                {
                    for $Detail in $input_Parameters/ELEGIDOSORIGINALES/*:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidosOriginales>
            <ns0:elegidosRemover>
                {
                    for $Detail in $input_Parameters/ELEGIDOSREMOVER/*:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidosRemover>
            {
                for $TIQUETE in $input_Parameters/TIQUETE
                return
                    <ns0:tiquete>{ data($TIQUETE) }</ns0:tiquete>
            }
            {
                for $VIGENCIA_ELEGIDO in $input_Parameters/VIGENCIA_ELEGIDO
                return
                    <ns0:vigenciaElegidos>{ data($VIGENCIA_ELEGIDO) }</ns0:vigenciaElegidos>
            }
            <ns0:fechaExpiracionElegidos>{ data($input_Parameters/FECHA_EXPIRACION_ELEGIDOS) }</ns0:fechaExpiracionElegidos>
        </ns0:EliminarSMSElegidosRequest>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:eliminarSMSElegidosIN_Req_ejecutarOperacionIN($input_Parameters)