(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA402.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama402/";
declare namespace xf = "http://tempuri.org/ITEL/Trama402/Resources/XQueries/validarTrama402_Req/";

declare function xf:validarTrama402Req($parametros as xs:string, $min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PARAMETROS>{ $parametros }</PARAMETROS>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;
declare variable $min as xs:string external;

xf:validarTrama402Req($parametros, $min)