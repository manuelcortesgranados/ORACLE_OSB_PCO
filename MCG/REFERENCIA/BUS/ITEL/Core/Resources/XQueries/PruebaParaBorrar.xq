xquery version "1.0" encoding "Cp1252";

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/PruebaParaBorrar/";

declare function xf:PruebaParaBorrar($resultCode as xs:string,
    $resultDescription as xs:string,
    $subscriptionId as xs:string)
    as xs:string {
        xs:string
};

declare variable $resultCode as xs:string external;
declare variable $resultDescription as xs:string external;
declare variable $subscriptionId as xs:string external;

xf:PruebaParaBorrar($resultCode,
    $resultDescription,
    $subscriptionId)
