(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CAMBIAR_MIN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CambiarMinRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CambiarMinIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/cambiarMinIN_Req_ejecutarOperacionIN/";

declare function xf:cambiarMinIN_Req_ejecutarOperacionIN($input_Parameters as element(ns0:Input_Parameters))
    as element(ns1:CambiarMinRequest) {
        <ns1:CambiarMinRequest prefijo = "{ data($input_Parameters/PREFIX) }"
                               min = "{ data($input_Parameters/MIN) }"
                               hostId = "{ data($input_Parameters/USUARIO) }"
                               requestorId = "{ data($input_Parameters/REQUESTOR_ID) }"
                               in = "{ data($input_Parameters/IN) }"
                               timeout = "{ data($input_Parameters/TIMEOUT) }">
            <ns1:suscriptor>{ $input_Parameters/SUSCRIPTOR/@*,$input_Parameters/SUSCRIPTOR/node() }</ns1:suscriptor>                   
        </ns1:CambiarMinRequest>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:cambiarMinIN_Req_ejecutarOperacionIN($input_Parameters)