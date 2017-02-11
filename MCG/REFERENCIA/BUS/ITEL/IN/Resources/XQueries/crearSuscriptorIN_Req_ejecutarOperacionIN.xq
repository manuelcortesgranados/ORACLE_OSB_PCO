(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CrearSuscriptorRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CrearSuscriptorIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/crearSuscriptorIN_Req_ejecutarOperacionIN/";

declare function xf:crearSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:CrearSuscriptorRequest) {
        <ns0:CrearSuscriptorRequest hostId = "{ data($input_Parameters/HOST_ID) }"
                                    requestorId = "{ data($input_Parameters/REQUESTOR_ID) }"
                                    in = "{ data($input_Parameters/IN) }"
                                    timeout = "{ data($input_Parameters/TIMEOUT) }">
            <ns0:suscriptor>{ $input_Parameters/SUSCRIPTOR/@*,$input_Parameters/SUSCRIPTOR/node() }</ns0:suscriptor>
        </ns0:CrearSuscriptorRequest>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:crearSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters)