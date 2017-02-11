(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_OLMOFFERS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarOLMOffers/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarOLMOffersPS_Req/";

declare function xf:consultarOLMOffersPS_Req($vigencia as xs:decimal,
    $cantidad as xs:decimal,
    $cuenta as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <VIGENCIA>{ $vigencia }</VIGENCIA>
            <CANTIDAD>{ $cantidad }</CANTIDAD>
            <CUENTA>{ $cuenta }</CUENTA>
        </ns0:Input_Parameters>
};

declare variable $vigencia as xs:decimal external;
declare variable $cantidad as xs:decimal external;
declare variable $cuenta as xs:decimal external;

xf:consultarOLMOffersPS_Req($vigencia,
    $cantidad,
    $cuenta)