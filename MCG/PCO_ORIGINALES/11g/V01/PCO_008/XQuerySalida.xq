
declare namespace xf = "http://tempuri.org/OSB_Project_PCO_008/XQuerySalida/";

declare function xf:XQuerySalida($cadenaJSONEntrada as xs:string)
    as xs:string {
        $cadenaJSONEntrada
};

declare variable $cadenaJSONEntrada as xs:string external;

xf:XQuerySalida($cadenaJSONEntrada)
