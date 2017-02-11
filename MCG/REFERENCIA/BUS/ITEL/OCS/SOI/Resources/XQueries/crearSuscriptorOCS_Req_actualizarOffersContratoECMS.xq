(:: pragma bea:global-element-return element="ns2:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_OFFERS_CONTRACT.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ActualizarOffersContratoOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorOCS_Req_actualizarOffersContratoECMS/";

declare function xf:crearSuscriptorOCS_Req_actualizarOffersContratoECMS($privatekey as xs:string,
    $offer as xs:string)
    as element(ns2:Input_Parameters) {
        <ns2:Input_Parameters>
            <PRIVATEKEY>{ $privatekey }</PRIVATEKEY>
            <OFFER>{ $offer }</OFFER>
        </ns2:Input_Parameters>
};

declare variable $privatekey as xs:string external;
declare variable $offer as xs:string external;

xf:crearSuscriptorOCS_Req_actualizarOffersContratoECMS($privatekey,
    $offer)
