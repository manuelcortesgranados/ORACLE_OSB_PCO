(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARUSUARIOMETODO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarUsuarioMetodo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_validarUsuarioMetodoLocal/";

declare function xf:ejecutarTrama_Req_validarUsuarioMetodoLocal($usuario as xs:string,
    $metodo as xs:integer)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <USUARIO>{ $usuario }</USUARIO>
            <METODO>{ $metodo }</METODO>
        </ns0:Input_Parameters>
};

declare variable $usuario as xs:string external;
declare variable $metodo as xs:integer external;

xf:ejecutarTrama_Req_validarUsuarioMetodoLocal($usuario,
    $metodo)