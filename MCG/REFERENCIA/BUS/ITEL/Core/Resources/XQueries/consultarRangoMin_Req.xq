(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRANGOMIN.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoMin/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRangoMin_Req/";

declare function xf:consultarRangoMin_Req($min as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;

xf:consultarRangoMin_Req($min)