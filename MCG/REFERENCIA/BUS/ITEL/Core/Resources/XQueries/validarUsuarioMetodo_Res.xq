(:: pragma bea:global-element-parameter parameter="$outputParameters" element="ns1:OutputParameters" location="../Schemas/BD_ITEL_VERIFICARUSUARIOMETODO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_VALIDARUSUARIOMETODO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_VERIFICAR_USUARIO_METODO/";
declare namespace ns0 = "http://www.comcel.com.co/ValidarUsuarioMetodo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarUsuarioMetodo_Res/";

declare function xf:validarUsuarioMetodo_Res($outputParameters as element(ns1:OutputParameters),
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>{ data($outputParameters/ns1:P_EXITO) }</MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $outputParameters as element(ns1:OutputParameters) external;
declare variable $descripcion as xs:string external;

xf:validarUsuarioMetodo_Res($outputParameters,
    $descripcion)