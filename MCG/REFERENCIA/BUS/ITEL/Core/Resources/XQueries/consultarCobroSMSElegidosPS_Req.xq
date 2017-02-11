xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCOBROSMSELEGIDOS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCobroSMSElegidosPS_Req/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarCobroSMSElegidos";

declare function xf:consultarCobroSMSElegidosPS_Req($codigoCobro as xs:string)
    as element(ns0:Input_Parameters) {
    	<ns0:Input_Parameters>
    		<ns0:CODIGO_COBRO>{$codigoCobro}</ns0:CODIGO_COBRO> 
        </ns0:Input_Parameters>
};

declare variable $codigoCobro as xs:string external;

xf:consultarCobroSMSElegidosPS_Req($codigoCobro)