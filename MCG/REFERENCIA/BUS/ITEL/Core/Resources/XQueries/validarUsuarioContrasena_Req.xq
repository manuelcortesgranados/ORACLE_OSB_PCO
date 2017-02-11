(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARUSUARIOCONTRASENA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarUsuarioContrasena/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarUsuarioContrasena_Req/";

declare function xf:validarUsuarioContrasena_Req($usuario as xs:string,
    $clave as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <USUARIO>{ $usuario }</USUARIO>
            <CONTRASENA>{ $clave }</CONTRASENA>
        </ns0:Input_Parameters>
};

declare variable $usuario as xs:string external;
declare variable $clave as xs:string external;

xf:validarUsuarioContrasena_Req($usuario,
    $clave)