(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARUSUARIOMETODO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_VERIFICARUSUARIOMETODO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_VERIFICAR_USUARIO_METODO/";
declare namespace ns0 = "http://www.comcel.com.co/ValidarUsuarioMetodo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarUsuarioMEtodo_Req_validarUsuarioMetodoBS/";

declare function xf:validarUsuarioMEtodo_Req_validarUsuarioMetodoBS($input_Parameters as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_USUARIO>{ data($input_Parameters/USUARIO) }</ns1:P_USUARIO>
            <ns1:P_METODO>{ data($input_Parameters/METODO) }</ns1:P_METODO>
        </ns1:InputParameters>
};

declare variable $input_Parameters as element(ns0:Input_Parameters) external;

xf:validarUsuarioMEtodo_Req_validarUsuarioMetodoBS($input_Parameters)