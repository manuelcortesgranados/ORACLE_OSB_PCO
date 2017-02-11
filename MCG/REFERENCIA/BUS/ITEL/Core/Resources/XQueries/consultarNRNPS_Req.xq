(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_NRN.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarNRN/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarNRNPS_Req/";

declare function xf:consultarNRNPS_Req($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:consultarNRNPS_Req($min)