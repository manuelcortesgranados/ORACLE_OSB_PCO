(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CAMBIAR_PLAN.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ChangePlanRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/CambiarPlanOCS/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_SOI";
declare namespace xf = "http://tempuri.org/ITEL/OCS/Resources/XQueries/cambiarPlanOCSSOI_Req_ejecutarOperacionOCSSOI/";

declare function xf:cambiarPlanOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:ChangePlanRequest) {
        <ns0:ChangePlanRequest contractID = "{ data($input_Parameters1/CONTRACTID) }"
                               ratePlanCode = "{ data($input_Parameters1/RATEPLANCODE) }"
                               isCharged = "{ data($input_Parameters1/ISCHARGED) }"/>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:cambiarPlanOCSSOI_Req_ejecutarOperacionOCSSOI($input_Parameters1)