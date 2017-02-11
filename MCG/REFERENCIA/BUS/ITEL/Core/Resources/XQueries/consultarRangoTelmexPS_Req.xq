(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../BSCS/Resources/Schemas/PS_ITEL_CONSULTARANGOTELMEX.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoTelmex/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRangoTelmexPS_Req/";

declare function xf:consultarRangoTelmexPS_Req($numeroFijo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <NUMERO>{ $numeroFijo }</NUMERO>
        </ns0:Input_Parameters>
};

declare variable $numeroFijo as xs:string external;

xf:consultarRangoTelmexPS_Req($numeroFijo)