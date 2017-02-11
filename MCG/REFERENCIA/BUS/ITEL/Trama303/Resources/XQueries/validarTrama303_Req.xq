(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA303.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama303/";
declare namespace xf = "http://tempuri.org/ITEL/Trama303/Resources/XQueries/validarTrama303_Req/";

declare function xf:validarTrama303Req($parametros as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PARAMETROS>{ $parametros }</PARAMETROS>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;

xf:validarTrama303Req($parametros)