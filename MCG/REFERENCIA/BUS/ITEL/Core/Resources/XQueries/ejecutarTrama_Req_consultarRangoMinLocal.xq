(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTrama_Req_consultarRangoMinLocal/";

declare function xf:ejecutarTrama_Req_consultarRangoMinLocal($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ xs:decimal($min) }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutarTrama_Req_consultarRangoMinLocal($min)