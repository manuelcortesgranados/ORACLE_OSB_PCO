(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_BLOQUEAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:BlockSuscriberRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/BloquearSuscriptorOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_SOI";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/bloquearSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI/";

declare function xf:bloquearSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:BlockSuscriberRequest) {
        <ns0:BlockSuscriberRequest contractID = "{ data($input_Parameters1/CONTRACTID) }"
                                   state = "{ data($input_Parameters1/STATE) }"
                                   reason = "{ data($input_Parameters1/REASON) }"
                                   timeout = "{ data($input_Parameters1/TIMEOUT) }"/>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:bloquearSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1)