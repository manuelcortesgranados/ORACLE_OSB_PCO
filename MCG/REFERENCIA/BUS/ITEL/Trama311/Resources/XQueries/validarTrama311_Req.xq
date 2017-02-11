(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA311.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama311/";
declare namespace xf = "http://tempuri.org/ITEL/Trama311/Resources/XQueries/validarTrama311_Req/";

declare function xf:validarTrama311Req($parametros as xs:string, $min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<MIN>{ $min }</MIN>
            <PARAMETROS>{ $parametros }</PARAMETROS>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama311Req($parametros, $min)