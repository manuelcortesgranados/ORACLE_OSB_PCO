(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_SMSOFFERSOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_SMSOFFERSOCS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarSMSOffersOCS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_SMSOFFERS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarSMSOffersOCS_Req/";

declare function xf:consultarSMSOffersOCS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_CANTIDAD_SMS>{ data($input_Parameters1/CANTIDAD_SMS) }</ns0:P_CANTIDAD_SMS>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarSMSOffersOCS_Req($input_Parameters1)