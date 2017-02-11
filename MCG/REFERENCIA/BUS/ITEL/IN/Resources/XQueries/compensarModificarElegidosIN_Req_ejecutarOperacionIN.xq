(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_MODIFICARELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CompensarModificarElegidosRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CompensarModificarElegidosIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarModificarElegidosIN_Req_ejecutarOperacionIN/";

declare function xf:compensarModificarElegidosIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CompensarModificarElegidosRequest) {
        <ns1:CompensarModificarElegidosRequest prefijo = "{ data($input_Parameters1/PREFIX) }"
                                               min = "{ data($input_Parameters1/MIN) }"
                                               diasVigencia = "{ data($input_Parameters1/DIAS_VIGENCIA) }"
                                               hostId = "{ data($input_Parameters1/USUARIO) }"
                                               requestorId = "{ data($input_Parameters1/REQUESTOR_ID) }"
                                               ilimitados = "{ data($input_Parameters1/ILIMITADOS) }"
                                               activacion = "{ data($input_Parameters1/ACTIVACION) }"
                                               removerTodos = "{ data($input_Parameters1/REMOVER_TODOS) }"
                                               in = "{ data($input_Parameters1/IN) }">
            {
                let $ELEGIDOS := $input_Parameters1/ELEGIDOS
                return
                    <ns1:elegidos>
                        {
                            for $Detail in $ELEGIDOS/*:Detail
                            return
                                <ns1:Detail>{ data($Detail) }</ns1:Detail>
                        }
                    </ns1:elegidos>
            }
            <ns1:elegidosOriginales>
                {
                    for $Detail in $input_Parameters1/ELEGIDOS_ORIGINALES/*:Detail
                    return
                        <ns1:Detail>{ data($Detail) }</ns1:Detail>
                }
            </ns1:elegidosOriginales>
            {
                for $ELEGIDOS_REMOVER in $input_Parameters1/ELEGIDOS_REMOVER
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
                for $TIQUETE in $input_Parameters1/TIQUETE
                return
                    <ns1:tiquete>{ data($TIQUETE) }</ns1:tiquete>
            }
            {
                for $VIGENCIA_ELEGIDO in $input_Parameters1/VIGENCIA_ELEGIDO
                return
                    <ns1:vigenciaElegidos>{ data($VIGENCIA_ELEGIDO) }</ns1:vigenciaElegidos>
            }
            <ns1:fechaExpiracionElegidos>{ data($input_Parameters1/FECHA_EXPIRACION_ELEGIDO) }</ns1:fechaExpiracionElegidos>
            
        </ns1:CompensarModificarElegidosRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:compensarModificarElegidosIN_Req_ejecutarOperacionIN($input_Parameters1)