(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA704.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama704/";
declare namespace xf = "http://tempuri.org/ITEL/Trama704/Resources/XQueries/validarTrama704_Req/";

declare function xf:validarTrama704Req($parametros as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <PARAMETROS>{ $parametros }</PARAMETROS>
        </ns0:Input_Parameters>
};

declare variable $parametros as xs:string external;

xf:validarTrama704Req($parametros)