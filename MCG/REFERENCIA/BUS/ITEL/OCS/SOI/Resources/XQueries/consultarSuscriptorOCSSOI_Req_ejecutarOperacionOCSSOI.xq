(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetSuscriberDataRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/ConsultarSuscriptorOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_SOI";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/consultarSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI/";

declare function xf:consultarSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:GetSuscriberDataRequest) {
        <ns0:GetSuscriberDataRequest customerID = "{ data($input_Parameters1/CUSTOMERID) }"
                                     timeout = "{ data($input_Parameters1/TIMEOUT) }"/>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarSuscriptorOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1)