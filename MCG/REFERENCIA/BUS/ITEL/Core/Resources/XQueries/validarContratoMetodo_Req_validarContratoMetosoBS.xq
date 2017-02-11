(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARCONTRATOMETODO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_VALIDARCONTRATOMETODO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ValidarContratoMetodo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_VALIDAR_CONTRATO_METODO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarContratoMetodo_Req_validarContratoMetosoBS/";

declare function xf:validarContratoMetodo_Req_validarContratoMetosoBS($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_CONTRATO>{ data($input_Parameters1/CONTRATO) }</ns0:P_CONTRATO>
            <ns0:P_METODO>{ data($input_Parameters1/METODO) }</ns0:P_METODO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:validarContratoMetodo_Req_validarContratoMetosoBS($input_Parameters1)