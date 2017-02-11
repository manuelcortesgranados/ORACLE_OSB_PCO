(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_VALIDACIONGENERAL.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_VALIDARGENERAL.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ValidacionGeneral/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_VALIDAR_GENERAL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validacionGeneral_Req/";

declare function xf:validacionGeneral_Req($input_Parameters as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters/MIN) }</ns0:P_MIN>
            <ns0:P_USUARIO>{ data($input_Parameters/USUARIO) }</ns0:P_USUARIO>
            <ns0:P_PASSWORD>{ data($input_Parameters/PASSWORD) }</ns0:P_PASSWORD>
            <ns0:P_METODO>{ data($input_Parameters/METODO) }</ns0:P_METODO>
        </ns0:InputParameters>
};

declare variable $input_Parameters as element(ns1:Input_Parameters) external;

xf:validacionGeneral_Req($input_Parameters)