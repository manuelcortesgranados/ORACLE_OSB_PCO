(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/db_VerificarPermisoUsuario_sp.xsd" ::)
(:: pragma bea:global-element-return element="ns0:OutputParameters" location="../Schemas/db_VerificarPermisoUsuario_sp.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_VerificarPermisoUsuario";
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_005/OSB/Resources/XQueries/verificarPermisosUsuario_SP_Res/";

declare function xf:verificarPermisosUsuario_SP_Res($outputParameters1 as element(ns0:OutputParameters))
    as element(ns0:OutputParameters) {
        <ns0:OutputParameters>
            {
                for $P_OUT_CODIGO in $outputParameters1/ns0:P_OUT_CODIGO
                return
                    <ns0:P_OUT_CODIGO>{ data($P_OUT_CODIGO) }</ns0:P_OUT_CODIGO>
            }
            {
                for $P_OUT_DESCRIPCION in $outputParameters1/ns0:P_OUT_DESCRIPCION
                return
                    <ns0:P_OUT_DESCRIPCION>{ data($P_OUT_DESCRIPCION) }</ns0:P_OUT_DESCRIPCION>
            }
        </ns0:OutputParameters>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:verificarPermisosUsuario_SP_Res($outputParameters1)