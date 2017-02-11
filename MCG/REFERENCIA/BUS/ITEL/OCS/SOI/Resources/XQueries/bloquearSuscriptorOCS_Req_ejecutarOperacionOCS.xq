(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_BLOQUEAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:BloquearSuscriptorRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/BloquearSuscriptorOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/bloquearSuscriptorOCS_Req_ejecutarOperacionOCS/";

declare function xf:bloquearSuscriptorOCS_Req_ejecutarOperacionOCS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:BloquearSuscriptorRequest) {
        <ns0:BloquearSuscriptorRequest min = "{ data($input_Parameters1/MIN) }"
        							   bloqueoFraude = "{ if(exists($input_Parameters1/BLOQUEO_FRAUDE)) then data($input_Parameters1/BLOQUEO_FRAUDE) else (-1) }"
        							   bloqueoGeneral = "{ if(exists($input_Parameters1/BLOQUEO_GENERAL)) then data($input_Parameters1/BLOQUEO_GENERAL) else (-1) }"
                                       in = "{ data($input_Parameters1/IN) }"
                                       timeout = "{ data($input_Parameters1/TIMEOUT) }"/>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:bloquearSuscriptorOCS_Req_ejecutarOperacionOCS($input_Parameters1)