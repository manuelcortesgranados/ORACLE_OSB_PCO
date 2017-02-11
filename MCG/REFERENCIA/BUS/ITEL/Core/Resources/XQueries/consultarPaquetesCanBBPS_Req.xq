(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PAQUETESCAN_BB.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarPaquetesCanBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesCanBBPS_Req/";

declare function xf:consultarPaquetesCanBBPS_Req($offerID as xs:string,
    $min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <OFFER_BB>{ $offerID }</OFFER_BB>
        </ns0:Input_Parameters>
};

declare variable $offerID as xs:string external;
declare variable $min as xs:string external;

xf:consultarPaquetesCanBBPS_Req($offerID,
    $min)
