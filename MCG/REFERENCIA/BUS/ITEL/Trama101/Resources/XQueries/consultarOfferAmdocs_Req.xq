(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Core/Resources/Schemas/PS_ITEL_CONSULTAR_OFFER_AMDOCS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarOfferAmdocs/";
declare namespace xf = "http://tempuri.org/ITEL/Trama101/Resources/XQueries/consultarOfferAmdocs_Req/";

declare function xf:consultarOfferAmdocs_Req($offerIN as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <OFFER>{ $offerIN }</OFFER>
        </ns0:Input_Parameters>
};

declare variable $offerIN as xs:string external;

xf:consultarOfferAmdocs_Req($offerIN)