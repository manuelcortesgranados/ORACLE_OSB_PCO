(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_VERIFICARUSUARIOPASSWORD.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARUSUARIOCONTRASENA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_VERIFICAR_USUARIO_PASSWORD/";
declare namespace ns0 = "http://www.comcel.com.co/ValidarUsuarioContrasena/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/validarUsuarioContrasena_Res/";

declare function xf:validarUsuarioContrasena_Res($outputParameters1 as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>{ data($outputParameters1/ns1:P_EXITO) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters1 as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:validarUsuarioContrasena_Res($outputParameters1,
    $descripcion)