(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/dbVerificarPermisosUsuario_sp.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbVerificarPermisosUsuario";
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_006/OSB/Resources/XQueries/verificarPermisoUsuarioLocal_SP_Request2Target/";

declare function xf:verificarPermisoUsuarioLocal_SP_Request2Target($idFuenteAplicacion1 as xs:string,
    $usuario1 as xs:string,
    $metodo1 as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_IN_SOURCEAPPLICATIONID>{ $idFuenteAplicacion1 }</ns0:P_IN_SOURCEAPPLICATIONID>
            <ns0:P_IN_USER>{ $usuario1 }</ns0:P_IN_USER>
            <ns0:P_IN_METHOD>{ $metodo1 }</ns0:P_IN_METHOD>
        </ns0:InputParameters>
};

declare variable $idFuenteAplicacion1 as xs:string external;
declare variable $usuario1 as xs:string external;
declare variable $metodo1 as xs:string external;

xf:verificarPermisoUsuarioLocal_SP_Request2Target($idFuenteAplicacion1,
    $usuario1,
    $metodo1)
