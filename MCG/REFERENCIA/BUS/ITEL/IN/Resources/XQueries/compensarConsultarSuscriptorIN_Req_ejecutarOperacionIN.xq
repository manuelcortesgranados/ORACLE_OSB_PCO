(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_CONSULTARSUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CompensarConsultarSuscriptorRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CompensarConsultarSuscriptorIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarConsultarSuscriptorIN_Req_ejecutarOperacionIN/";

declare function xf:compensarConsultarSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CompensarConsultarSuscriptorRequest) {
        <ns1:CompensarConsultarSuscriptorRequest prefijo = "{ data($input_Parameters1/PREFIJO) }"
                                        min = "{ data($input_Parameters1/MIN) }"
                                        fechaExpiracion = "{ data($input_Parameters1/FECHA_EXPIRACION) }"
                                        in = "{ data($input_Parameters1/IN) }">
            <ns1:carga politicaExpiracion = "{ data($input_Parameters1/POLITICA_EXPIRACION) }"
                       diasExtension = "{ data($input_Parameters1/DIAS_EXTENSION) }"
                       fechaAbsoluta = "{ data($input_Parameters1/FECHA_ABSOLUTA) }"
                       cuenta = "{ data($input_Parameters1/CUENTA) }"
                       valor = "{ data($input_Parameters1/VALOR) }"
                       usuario = "{ data($input_Parameters1/USUARIO) }"
                       requestorId = "{ data($input_Parameters1/REQUESTOR_ID) }">
                <ns1:tiquete>{ data($input_Parameters1/TIQUETE) }</ns1:tiquete>
                <ns1:tiqueteCompensacion>{ data($input_Parameters1/TIQUETE_COMPENSACION) }</ns1:tiqueteCompensacion>
            </ns1:carga>
        </ns1:CompensarConsultarSuscriptorRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:compensarConsultarSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters1)