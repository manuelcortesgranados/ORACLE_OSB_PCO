(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_MODIFICAR_ELEGIDOSFIJOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:ModificarFARequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/ModificarElegidosFijosIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/modificarElegidosFijosIN_Req_ejecutarOperacionIN/";

declare function xf:modificarElegidosFijosIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:ModificarFARequest) {
        <ns1:ModificarFARequest prefijo = "{ data($input_Parameters1/PREFIJO) }"
                                min = "{ data($input_Parameters1/MIN) }"
                                diasVigencia = "{ data($input_Parameters1/DIAS_VIGENCIA) }"
                                hostId = "{ data($input_Parameters1/USUARIO) }"
                                requestorId = "{ data($input_Parameters1/REQUESTOR_ID) }"
                                activacion = "{ data($input_Parameters1/ACTIVACION) }"
                                removerTodos = "{ data($input_Parameters1/REMOVER_TODOS) }"
                                in = "{ data($input_Parameters1/IN) }"
                                timeout = "{ data($input_Parameters1/TIMEOUT) }">
            <ns1:elegidos>
                {
                    for $Detail in $input_Parameters1/ELEGIDOS/*:Detail
                    return
                        <ns1:Detail>{ data($Detail) }</ns1:Detail>
                }
            </ns1:elegidos>
            <ns1:elegidosOriginales>
                {
                    for $Detail in $input_Parameters1/ELEGIDOSORIGINALES/*:Detail
                    return
                        <ns1:Detail>{ data($Detail) }</ns1:Detail>
                }
            </ns1:elegidosOriginales>
            <ns1:elegidosRemover>
                {
                    for $Detail in $input_Parameters1/ELEGIDOSREMOVER/*:Detail
                    return
                        <ns1:Detail>{ data($Detail) }</ns1:Detail>
                }
            </ns1:elegidosRemover>
            {
                for $TIQUETE in $input_Parameters1/TIQUETE
                return
                    <ns1:tiquete>{ data($TIQUETE) }</ns1:tiquete>
            }
            {
                for $VIGENCIA_ELEGIDO in $input_Parameters1/VIGENCIA_ELEGIDO
                return
                    <ns1:vigenciaElegidos>{ data($VIGENCIA_ELEGIDO) }</ns1:vigenciaElegidos>
            }
            {
                for $FECHA_EXPIRACION_ELEGIDO in $input_Parameters1/FECHA_EXPIRACION_ELEGIDO
                return
                    <ns1:fechaExpiracionElegidos>{ data($FECHA_EXPIRACION_ELEGIDO) }</ns1:fechaExpiracionElegidos>
            }
        </ns1:ModificarFARequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:modificarElegidosFijosIN_Req_ejecutarOperacionIN($input_Parameters1)