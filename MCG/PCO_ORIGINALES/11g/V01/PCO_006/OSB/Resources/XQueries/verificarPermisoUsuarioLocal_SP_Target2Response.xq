(:: pragma bea:global-element-return element="ns0:firmaServicioGeneralResponse" location="../Schemas/FirmaServicioGeneral.xsd" ::)

declare namespace ns0 = "http://www.example.org/FirmaServicioGeneral";
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_006/OSB/Resources/XQueries/verificarPermisoUsuarioLocal_SP_Target2Response/";

declare function xf:verificarPermisoUsuarioLocal_SP_Target2Response($p_OUT_CODIGO1 as xs:string,
    $p_OUT_DESCRIPCION1 as xs:string)
    as element(ns0:firmaServicioGeneralResponse) {
        <ns0:firmaServicioGeneralResponse>
            <ns0:codigo>{ $p_OUT_CODIGO1 }</ns0:codigo>
            <ns0:descripcion>{ $p_OUT_DESCRIPCION1 }</ns0:descripcion>
        </ns0:firmaServicioGeneralResponse>
};

declare variable $p_OUT_CODIGO1 as xs:string external;
declare variable $p_OUT_DESCRIPCION1 as xs:string external;

xf:verificarPermisoUsuarioLocal_SP_Target2Response($p_OUT_CODIGO1,
    $p_OUT_DESCRIPCION1)
