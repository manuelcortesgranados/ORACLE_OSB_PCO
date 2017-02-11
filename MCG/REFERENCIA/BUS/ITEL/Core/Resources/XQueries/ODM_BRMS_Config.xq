xquery version "1.0" encoding "Cp1252";
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ODM_BRMS_Config/";

declare function xf:ODM_BRMS_Config()
as element(*) {  
    <config> 
       <usuario>{data("prueba")}</usuario>
       <clave>{data("prueba")}</clave>
       <cobro>{data("1")}</cobro>
       <canal>{data("10415")}</canal>
    </config>
};


xf:ODM_BRMS_Config()
