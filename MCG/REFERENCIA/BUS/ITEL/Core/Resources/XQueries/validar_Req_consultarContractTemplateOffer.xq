(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTEMPSC_OFFER.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarConTempSCOffer/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarContractTemplateOffer/";

declare function xf:validar_Req_consultarContractTemplateOffer($offer as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <OFFER>{ $offer }</OFFER>
        </ns0:Input_Parameters>
};

declare variable $offer as xs:string external;

xf:validar_Req_consultarContractTemplateOffer($offer)