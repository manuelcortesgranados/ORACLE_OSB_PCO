(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CrearSuscriptorRequest" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns0 = "http://www.comcel.com.co/CrearSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorOCS_Req_ejecutarOperacionOCS/";

declare function xf:crearSuscriptorOCS_Req_ejecutarOperacionOCS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:CrearSuscriptorRequest) {
        <ns1:CrearSuscriptorRequest in = "{ data($input_Parameters1/IN) }"
                                    timeout = "{ data($input_Parameters1/TIMEOUT) }">
                                    <ns1:suscriptor>{ $input_Parameters1/SUSCRIPTOR/@*,$input_Parameters1/SUSCRIPTOR/node() }</ns1:suscriptor>
           <!-- {
                let $SUSCRIPTOR := $input_Parameters1/SUSCRIPTOR
                return
                    <ns1:suscriptor/>
            }-->
        </ns1:CrearSuscriptorRequest>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:crearSuscriptorOCS_Req_ejecutarOperacionOCS($input_Parameters1)