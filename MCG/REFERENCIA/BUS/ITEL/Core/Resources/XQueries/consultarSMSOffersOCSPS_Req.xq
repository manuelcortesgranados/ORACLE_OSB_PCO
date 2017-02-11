(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SMSOFFERSOCS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarSMSOffersOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarSMSOffersOCSPS_Req/";

declare function xf:consultarSMSOffersOCSPS_Req($cantidadSMS as xs:decimal)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CANTIDAD_SMS>{ $cantidadSMS }</CANTIDAD_SMS>
        </ns0:Input_Parameters>
};

declare variable $cantidadSMS as xs:decimal external;

xf:consultarSMSOffersOCSPS_Req($cantidadSMS)