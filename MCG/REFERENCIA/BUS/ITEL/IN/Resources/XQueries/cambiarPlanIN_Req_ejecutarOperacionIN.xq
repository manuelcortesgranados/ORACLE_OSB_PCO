(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CAMBIAR_PLAN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CambiarPlanRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CambiarPlanIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/cambiarPlanIN_Req_ejecutarOperacionIN/";

declare function xf:cambiarPlanIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:CambiarPlanRequest) {
        <ns0:CambiarPlanRequest prefijo = "{ data($input_Parameters/PREFIX) }"
                                min = "{ data($input_Parameters/MIN) }"
                                plan = "{ data($input_Parameters/PLAN) }"
                                planOriginal = "{ data($input_Parameters/PLAN_ORIGINAL) }"
                                in = "{ data($input_Parameters/IN) }"
                                timeout = "{ data($input_Parameters/TIMEOUT) }">
            {
                let $CARGA := $input_Parameters/CARGA
                where fn:empty($CARGA) = xs:boolean("false")
                return
                    <ns0:carga politicaExpiracion = "{ data($CARGA/POLITICA_EXPIRACION) }"
                               diasExtension = "{ data($CARGA/DIAS_EXTENSION) }"
                               fechaAbsoluta = "{ data($CARGA/FECHA_ABSOLUTA) }"
                               cuenta = "{ data($CARGA/CUENTA) }"
                               valor = "{ data($CARGA/VALOR) }"
                               usuario = "{ data($CARGA/USUARIO) }"
                               requestorId = "{ data($CARGA/REQUESTOR_ID) }">
                        <ns0:tiquete>{ data($CARGA/TIQUETE) }</ns0:tiquete>
                        <ns0:tiqueteCompensacion>{ data($CARGA/TIQUETE_COMPENSACION) }</ns0:tiqueteCompensacion>
                    </ns0:carga>
            }
        </ns0:CambiarPlanRequest>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:cambiarPlanIN_Req_ejecutarOperacionIN($input_Parameters)