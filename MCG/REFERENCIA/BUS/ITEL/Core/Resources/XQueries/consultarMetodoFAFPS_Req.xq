(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARTIPOFAF.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarTipoFAF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarTipoFAFPS_Req/";

declare function xf:consultarTipoFAFPS_Req($metodo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TIPO>{ $metodo }</TIPO>
        </ns0:Input_Parameters>
};

declare variable $metodo as xs:string external;

xf:consultarTipoFAFPS_Req($metodo)