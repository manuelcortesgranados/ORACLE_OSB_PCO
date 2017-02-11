(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_CONSECUTIVO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONSECUTIVO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONSECUTIVO/";
declare namespace ns0 = "http://www.comcel.com.co/consultarConsecutivo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarConsecutivo_Req/";

declare function xf:consultarConsecutivo_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CONSECUTIVO>{ data($input_Parameters1/CONSECUTIVO) }</ns1:P_CONSECUTIVO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarConsecutivo_Req($input_Parameters1)