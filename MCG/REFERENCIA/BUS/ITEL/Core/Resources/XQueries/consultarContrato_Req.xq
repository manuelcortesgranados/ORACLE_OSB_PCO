(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTRATO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTRATO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarContract";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTRACT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContract_Req/";

declare function xf:consultarContract_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_TMCODE>{ data($input_Parameters1/ns1:TMCODE) }</ns0:P_TMCODE>
            <ns0:P_SPCODE>{ data($input_Parameters1/ns1:SPCODE) }</ns0:P_SPCODE>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarContract_Req($input_Parameters1)