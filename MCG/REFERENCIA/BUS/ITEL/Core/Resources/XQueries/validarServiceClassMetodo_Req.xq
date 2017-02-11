(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_VALIDAR_SERVCLASS_METODO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_VALIDAR_SERVCLA_METODO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ValidarServClassMetodo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_VALIDAR_SERVCLA_METODO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarServiceClassMetodo_Req/";

declare function xf:validarServiceClassMetodo_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_SERVICECLASS>{ data($input_Parameters1/SERVICECLASS) }</ns0:P_SERVICECLASS>
            <ns0:P_METODO>{ data($input_Parameters1/METODO) }</ns0:P_METODO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:validarServiceClassMetodo_Req($input_Parameters1)