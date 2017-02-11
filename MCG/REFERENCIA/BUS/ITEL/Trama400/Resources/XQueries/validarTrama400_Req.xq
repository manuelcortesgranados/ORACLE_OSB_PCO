(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA400.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama400/";
declare namespace xf = "http://tempuri.org/ITEL/Trama400/Resources/XQueries/validarTrama400_Req/";

declare function xf:validarTrama400Req($parametros as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PARAMETROS>{ $parametros }</PARAMETROS>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;

xf:validarTrama400Req($parametros)