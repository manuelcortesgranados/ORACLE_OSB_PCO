(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA313.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama313/";
declare namespace xf = "http://tempuri.org/ITEL/Trama313/Resources/XQueries/validarTrama313_Req/";

declare function xf:validarTrama313Req($parametros as xs:string, $min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<MIN>{ $min } </MIN>
            <PARAMETROS>{ $parametros }</PARAMETROS>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama313Req($parametros, $min)