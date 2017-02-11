(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_OLMOFFERS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_OLMOFFERS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarOLMOffers/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_OLMOFFERS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarOLMOffers_Req/";

declare function xf:consultarOLMOffers_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_VIGENCIA>{ data($input_Parameters1/VIGENCIA) }</ns0:P_VIGENCIA>
            <ns0:P_CANTIDAD>{ data($input_Parameters1/CANTIDAD) }</ns0:P_CANTIDAD>
            <ns0:P_CUENTA>{ data($input_Parameters1/CUENTA) }</ns0:P_CUENTA>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarOLMOffers_Req($input_Parameters1)