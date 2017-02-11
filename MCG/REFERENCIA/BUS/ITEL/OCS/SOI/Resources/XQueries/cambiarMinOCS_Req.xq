(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CAMBIAR_MIN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CambiarMinRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns0 = "http://www.comcel.com.co/CambiarMinOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/cambiarMinOCS_Req/";

declare function xf:cambiarMinOCS_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CambiarMinRequest) {
        <ns1:CambiarMinRequest minAnterior = "{ data($input_Parameters1/MIN_ANTERIOR) }"
                               in = "{ data($input_Parameters1/IN) }"
                               timeout = "{ data($input_Parameters1/TIMEOUT) }">
                               <ns1:suscriptorNuevo>{ $input_Parameters1/SUSCRIPTOR_NUEVO/@*,$input_Parameters1/SUSCRIPTOR_NUEVO/node() }</ns1:suscriptorNuevo>
            <!--{
                let $SUSCRIPTOR_NUEVO := $input_Parameters1/SUSCRIPTOR_NUEVO
                return
                    <ns1:suscriptorNuevo/>
            }-->
        </ns1:CambiarMinRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:cambiarMinOCS_Req($input_Parameters1)