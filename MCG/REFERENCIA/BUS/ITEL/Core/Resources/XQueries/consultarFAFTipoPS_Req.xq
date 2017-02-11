(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns2:WS_Result" location="../../../OCS/AIR/Resources/Schemas/PS_ITEL_CONSULTAR_FAFLIST.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARFAFTIPO.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarFaFListOCS/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarFAFTipo/";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFAFTipoPS_Req/";

declare function xf:consultarFAFTipoPS_Req($wS_Result1 as element(ns2:WS_Result))
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <FAFLIST>{ fn:string-join(data($wS_Result1/MENSAJE/CONSULTAR_FAFLIST/fafInformationList/Detail/fafIndicator),";") }</FAFLIST>
        </ns1:Input_Parameters>
};

declare variable $wS_Result1 as element(ns2:WS_Result) external;

xf:consultarFAFTipoPS_Req($wS_Result1)