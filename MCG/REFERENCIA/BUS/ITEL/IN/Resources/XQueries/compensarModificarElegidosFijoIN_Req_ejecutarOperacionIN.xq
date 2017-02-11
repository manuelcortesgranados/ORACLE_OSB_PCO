(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_MODIFICARELEGIDOS_FIJOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CompensarModificarFARequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarModificarElegidosFijosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarModificarElegidosFijoIN_Req_ejecutarOperacionIN/";

declare function xf:compensarModificarElegidosFijoIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:CompensarModificarFARequest) {
        <ns0:CompensarModificarFARequest prefijo = "{ data($input_Parameters1/PREFIX) }"
                                         min = "{ data($input_Parameters1/MIN) }"
                                         diasVigencia = "{ data($input_Parameters1/DIAS_VIGENCIA) }"
                                         hostId = "{ data($input_Parameters1/USUARIO) }"
                                         requestorId = "{ data($input_Parameters1/REQUESTOR_ID) }"
                                         activacion = "{ data($input_Parameters1/ACTIVACION) }"
                                         removerTodos = "{ data($input_Parameters1/REMOVER_TODOS) }"
                                         in = "{ data($input_Parameters1/IN) }">
            <ns0:elegidos>
                {
                    for $Detail in $input_Parameters1/ELEGIDOS/*:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidos>
            <ns0:elegidosOriginales>
                {
                    for $Detail in $input_Parameters1/ELEGIDOS_ORIGINALES/*:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidosOriginales>
            <ns0:elegidosRemover>
                {
                    for $Detail in $input_Parameters1/ELEGIDOS_REMOVER/*:Detail
                    return
                        <ns0:Detail>{ data($Detail) }</ns0:Detail>
                }
            </ns0:elegidosRemover>
            {
                for $TIQUETE in $input_Parameters1/TIQUETE
                return
                    <ns0:tiquete>{ data($TIQUETE) }</ns0:tiquete>
            }
            {
                for $VIGENCIA_ELEGIDO in $input_Parameters1/VIGENCIA_ELEGIDO
                return
                    <ns0:vigenciaElegidos>{ data($VIGENCIA_ELEGIDO) }</ns0:vigenciaElegidos>
            }
            <ns0:fechaExpiracionElegidos>{ data($input_Parameters1/FECHA_EXPIRACION_ELEGIDO) }</ns0:fechaExpiracionElegidos>
        </ns0:CompensarModificarFARequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:compensarModificarElegidosFijoIN_Req_ejecutarOperacionIN($input_Parameters1)