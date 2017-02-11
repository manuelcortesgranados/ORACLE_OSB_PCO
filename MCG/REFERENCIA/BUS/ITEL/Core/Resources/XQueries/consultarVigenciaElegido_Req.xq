xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARVIGENCIAELEGIDO.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarVigenciaElegido_Req/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarVigenciaElegido/";

declare function xf:consultarVigenciaElegido_Req($min as xs:string,
    $minElegido as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<MIN>{xs:decimal($min)}</MIN>
        	<MIN_ELEGIDO>{xs:decimal($minElegido)}</MIN_ELEGIDO>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $minElegido as xs:string external;

xf:consultarVigenciaElegido_Req($min,
    $minElegido)