(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ConsultarSuscriptorRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarSuscriptorIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/consultarSuscriptorIN_Req_ejecutarOperacionIN/";

declare function xf:consultarSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:ConsultarSuscriptorRequest) {
        <ns0:ConsultarSuscriptorRequest prefijo = "{ data($input_Parameters/PREFIX) }"
                                   min = "{ data($input_Parameters/MIN) }"
                                   in = "{ data($input_Parameters/IN) }"
                                   timeout = "{ data($input_Parameters/TIMEOUT) }"/>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:consultarSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters)