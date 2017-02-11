(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA601.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama601/";
declare namespace xf = "http://tempuri.org/ITEL/Trama601/Resources/XQueries/validarTrama601_Req/";

declare function xf:validarTrama601Req($parametros as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PARAMETROS>{ $parametros }</PARAMETROS>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;

xf:validarTrama601Req($parametros)