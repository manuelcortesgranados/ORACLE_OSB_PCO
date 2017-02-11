(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA302.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama302/";
declare namespace xf = "http://tempuri.org/ITEL/Trama302/Resources/XQueries/validarTrama302_Req/";

declare function xf:validarTrama302Req($parametros as xs:string, $min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PARAMETROS>{ $parametros }</PARAMETROS>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama302Req($parametros, $min)