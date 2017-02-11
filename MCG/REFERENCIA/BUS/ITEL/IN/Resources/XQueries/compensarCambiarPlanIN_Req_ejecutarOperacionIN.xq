(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_CAMBIARPLAN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CompensarCambiarPlanRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CompensarCambiarPlanIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarCambiarPlanIN_Req_ejecutarOperacionIN/";

declare function xf:compensarCambiarPlanIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CompensarCambiarPlanRequest) {
        <ns1:CompensarCambiarPlanRequest prefijo = "{ data($input_Parameters1/PREFIJO) }"
                                         min = "{ data($input_Parameters1/MIN) }"
                                         plan = "{ data($input_Parameters1/PLAN_ORIGINAL) }"
                                         fechaExpiracion = "{ data($input_Parameters1/FECHA_EXPIRACION) }"
                                         in = "{ data($input_Parameters1/IN) }">
            {
                let $CARGA := $input_Parameters1/CARGA
                return
                    <ns1:carga politicaExpiracion = "{ data($CARGA/@politicaExpiracion) }"
                               diasExtension = "{ data($CARGA/@diasExtension) }"
                               fechaAbsoluta = "{ data($CARGA/@fechaAbsoluta) }"
                               cuenta = "{ data($CARGA/@cuenta) }"
                               valor = "{ data($CARGA/@valor) }"
                               usuario = "{ data($CARGA/@usuario) }"
                               requestorId = "{ data($CARGA/@requestorId) }">
                        <ns1:tiquete>{ data($CARGA/ns1:tiquete) }</ns1:tiquete>
                        <ns1:tiqueteCompensacion>{ data($CARGA/ns1:tiqueteCompensacion) }</ns1:tiqueteCompensacion>
                    </ns1:carga>
            }
        </ns1:CompensarCambiarPlanRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:compensarCambiarPlanIN_Req_ejecutarOperacionIN($input_Parameters1)