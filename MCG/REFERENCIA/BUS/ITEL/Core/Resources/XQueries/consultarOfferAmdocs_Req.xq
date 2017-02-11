(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_OFFER_AMDOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_OFFER_AMDOCS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarOfferAmdocs/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarOfferAmdocs";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarOfferAmdocs_Req/";

declare function xf:consultarOfferAmdocs_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_OFFER>{ data($input_Parameters1/OFFER) }</ns0:P_OFFER>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarOfferAmdocs_Req($input_Parameters1)