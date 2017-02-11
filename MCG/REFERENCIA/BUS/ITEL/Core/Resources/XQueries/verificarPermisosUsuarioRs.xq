declare namespace xf = "http://tempuri.org/OSB_Project_PCO_005/OSB/Resources/XQueries/verificarPermisosUsuarioRs/";

declare function xf:verificarPermisosUsuarioRs($variableEntrada as xs:string)
    as xs:string {
    let $variableManolito := ' '
    return
        concat($variableManolito,$variableEntrada)

};

declare variable $variableEntrada as xs:string external;

xf:verificarPermisosUsuarioRs($variableEntrada)