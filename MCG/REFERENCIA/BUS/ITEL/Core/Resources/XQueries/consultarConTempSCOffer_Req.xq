(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTEMPSC_OFFER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTEMP_OFFER.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarConTempSCOffer/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTEMP_OFFER/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarConTempSCOffer_Req/";

declare function xf:consultarConTempSCOffer_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_OFFER>{ data($input_Parameters1/OFFER) }</ns0:P_OFFER>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarConTempSCOffer_Req($input_Parameters1)