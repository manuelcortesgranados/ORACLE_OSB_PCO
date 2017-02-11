(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ELIMINAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:EliminarSuscriptorRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns0 = "http://www.comcel.com.co/EliminarSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/eliminarSuscriptorOCS_Req_ejecutarOperacionOCS/";

declare function xf:eliminarSuscriptorOCS_Req_ejecutarOperacionOCS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:EliminarSuscriptorRequest) {
        <ns1:EliminarSuscriptorRequest min = "{ data($input_Parameters1/MIN) }"
                                       in = "{ data($input_Parameters1/IN) }"
                                       timeout = "{ data($input_Parameters1/TIMEOUT) }"/>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:eliminarSuscriptorOCS_Req_ejecutarOperacionOCS($input_Parameters1)