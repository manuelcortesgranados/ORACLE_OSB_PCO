(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA406.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama406/";
declare namespace xf = "http://tempuri.org/ITEL/Trama406/Resources/XQueries/validarTrama406_Req/";

declare function xf:validarTrama406Req($parametros as xs:string, $in as xs:integer)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PARAMETROS>{ $parametros }</PARAMETROS>
            <IN>{ $in }</IN>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;
declare variable $in as xs:integer external;

xf:validarTrama406Req($parametros, $in)