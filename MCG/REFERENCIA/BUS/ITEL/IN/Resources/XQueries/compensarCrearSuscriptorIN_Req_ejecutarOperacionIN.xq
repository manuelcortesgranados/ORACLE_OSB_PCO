(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_CREARSUSCRIPTOR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:CompensarCrearSuscriptorRequest" location="../Schemas/DA_ITEL_OPERACION_CORBA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CompensarCrearSuscriptorIN/";
declare namespace ns0 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/compensarCrearSuscriptorIN_Req_ejecutarOperacionIN/";

declare function xf:compensarCrearSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:CompensarCrearSuscriptorRequest) {
        <ns0:CompensarCrearSuscriptorRequest prefijo = "{ data($input_Parameters1/PREFIJO) }"
                                                min = "{ data($input_Parameters1/MIN) }"
                                                in = "{ data($input_Parameters1/IN) }"/>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:compensarCrearSuscriptorIN_Req_ejecutarOperacionIN($input_Parameters1)