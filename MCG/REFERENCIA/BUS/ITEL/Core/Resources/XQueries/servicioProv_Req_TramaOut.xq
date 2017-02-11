xquery version "1.0" encoding "Cp1252";
(:: pragma  parameter="$parametrosEntrada" type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProv_Req_TramaOut/";

declare function xf:servicioProv_Req_TramaOut($parametrosTrama as element(*), $codigoError as xs:string, $descripcionError as xs:string, $parametrosSalida as xs:string)
    as xs:string {
        concat("provision","!",data($parametrosTrama/METODO),"!",$codigoError,"!",$descripcionError,"!",$parametrosSalida,"!*")
};

declare variable $parametrosTrama as element(*) external;
declare variable $codigoError as xs:string external;
declare variable $descripcionError as xs:string external;
declare variable $parametrosSalida as xs:string external;

xf:servicioProv_Req_TramaOut($parametrosTrama, $codigoError, $descripcionError, $parametrosSalida)