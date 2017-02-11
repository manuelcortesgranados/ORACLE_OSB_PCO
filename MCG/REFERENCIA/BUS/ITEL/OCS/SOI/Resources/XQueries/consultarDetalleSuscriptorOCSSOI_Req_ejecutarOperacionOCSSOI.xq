(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetSuscriberDetailsRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/ConsultarDetalleSuscriptorOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_SOI";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/consultarDetalleSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI/";

declare function xf:consultarDetalleSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:GetSuscriberDetailsRequest) {
        <ns0:GetSuscriberDetailsRequest contractId = "{ data($input_Parameters1/CONTRACTID) }"
                                        spCode = "{ data($input_Parameters1/SPCODE) }"
                                        snCode = "{ data($input_Parameters1/SNCODE) }"
                                        profileID = "{ data($input_Parameters1/PROFILEID) }"
                                        timeout = "{ data($input_Parameters1/TIMEOUT) }"/>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarDetalleSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1)