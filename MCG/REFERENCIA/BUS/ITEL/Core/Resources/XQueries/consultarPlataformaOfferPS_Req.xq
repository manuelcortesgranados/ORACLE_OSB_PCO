(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PLATAFORMA_OFFER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarPlataformaOffer/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPlataformaOfferPS_Req/";

declare function xf:consultarPlataformaOfferPS_Req($offerID as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <OFFER_ID>{ $offerID }</OFFER_ID>
        </ns0:Input_Parameters>
};

declare variable $offerID as xs:string external;

xf:consultarPlataformaOfferPS_Req($offerID)
