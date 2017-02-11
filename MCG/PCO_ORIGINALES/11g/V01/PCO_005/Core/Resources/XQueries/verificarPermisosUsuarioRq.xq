(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/db_VerificarPermisoUsuario_sp.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_VerificarPermisoUsuario";
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_005/OSB/Resources/XQueries/verificarPermisosUsuarioRq/";

declare function xf:verificarPermisosUsuarioRq($SOURCE_APPLICATION_ID as xs:string,
    $ITEL_USER as xs:string,
    $METHOD as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_IN_SOURCEAPPLICATIONID>{ $SOURCE_APPLICATION_ID }</ns0:P_IN_SOURCEAPPLICATIONID>
            <ns0:P_IN_USER>{ $ITEL_USER }</ns0:P_IN_USER>
            <ns0:P_IN_METHOD>{ $METHOD }</ns0:P_IN_METHOD>
        </ns0:InputParameters>
};

declare variable $SOURCE_APPLICATION_ID as xs:string external;
declare variable $ITEL_USER as xs:string external;
declare variable $METHOD as xs:string external;

xf:verificarPermisosUsuarioRq($SOURCE_APPLICATION_ID,
    $ITEL_USER,
    $METHOD)