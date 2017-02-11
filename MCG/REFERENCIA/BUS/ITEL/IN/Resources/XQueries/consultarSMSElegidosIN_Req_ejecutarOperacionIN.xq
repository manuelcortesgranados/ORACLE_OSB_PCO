(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SMSELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:ConsultarSMSElegidosRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarSMSElegidosIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/consultarSMSElegidosIN_Req_ejecutarOperacionIN/";

declare function xf:consultarSMSElegidosIN_Req_ejecutarOperacionIN($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:ConsultarSMSElegidosRequest) {
        <ns0:ConsultarSMSElegidosRequest prefijo = "{ data($input_Parameters/PREFIJO) }"
                                         min = "{ data($input_Parameters/MIN) }"
                                         hostId = "{ data($input_Parameters/USUARIO) }"
                                         requestorId = "{ data($input_Parameters/REQUESTOR_ID) }"
                                         in = "{ data($input_Parameters/IN) }"
                                         timeout = "{ data($input_Parameters/TIMEOUT) }"/>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:consultarSMSElegidosIN_Req_ejecutarOperacionIN($input_Parameters)