(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARFAFTIPO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarFAFTipo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultaFAFTipoPS_Req/";

declare function xf:consultaFAFTipoPS_Req($faf as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <FAFLIST>{ $faf }</FAFLIST>
        </ns0:Input_Parameters>
};

declare variable $faf as xs:string external;

xf:consultaFAFTipoPS_Req($faf)