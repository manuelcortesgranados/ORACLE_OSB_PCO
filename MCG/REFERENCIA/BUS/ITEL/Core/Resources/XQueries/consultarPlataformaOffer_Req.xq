(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PLATAFORMA_OFFER.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_CONSULTAR_PLATAFORMA_OFFER.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/consultarPlataformaOffer/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_consultarPlataformaOffer";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPlataformaOffer_Req/";

declare function xf:consultarPlataformaOffer_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_OFFER_ID>{ data($input_Parameters1/OFFER_ID) }</ns0:P_OFFER_ID>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarPlataformaOffer_Req($input_Parameters1)
