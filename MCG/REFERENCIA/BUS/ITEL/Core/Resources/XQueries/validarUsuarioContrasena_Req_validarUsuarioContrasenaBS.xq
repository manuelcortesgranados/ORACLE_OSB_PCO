(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARUSUARIOCONTRASENA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_VERIFICARUSUARIOPASSWORD.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_VERIFICAR_USUARIO_PASSWORD/";
declare namespace ns0 = "http://www.comcel.com.co/ValidarUsuarioContrasena/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/validarUsuarioContrasena_Req_validarUsuarioContrasenaBS/";

declare function xf:validarUsuarioContrasena_Req_validarUsuarioContrasenaBS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_USUARIO>{ data($input_Parameters1/USUARIO) }</ns1:P_USUARIO>
            <ns1:P_PASSWORD>{ data($input_Parameters1/CONTRASENA) }</ns1:P_PASSWORD>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:validarUsuarioContrasena_Req_validarUsuarioContrasenaBS($input_Parameters1)