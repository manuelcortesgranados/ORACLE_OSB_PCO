(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PARAMETROS_BB.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarParametrosBB/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarParametrosBBPS_Req/";

declare function xf:consultarParametrosBBPS_Req($offerBB as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <OFFER_BB>{ $offerBB }</OFFER_BB>
        </ns0:Input_Parameters>
};

declare variable $offerBB as xs:string external;

xf:consultarParametrosBBPS_Req($offerBB)
