
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_003/OSB/Resources/XQuery/XQuerySalida/";

declare function xf:XQuerySalida($parametroEntrada as xs:string)
    as xs:string {
    let $variableManolito := 'TEST'
    return
        concat($variableManolito,$parametroEntrada)
};

declare variable $parametroEntrada as xs:string external;

xf:XQuerySalida($parametroEntrada)
