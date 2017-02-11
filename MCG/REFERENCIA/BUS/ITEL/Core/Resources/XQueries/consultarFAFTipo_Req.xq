(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARFAFTIPO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_FAFTIPO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarFAFTipo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_FAFTIPO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFAFTipo_Req/";

declare function xf:consultarFAFTipo_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_FAFLIST>{ data($input_Parameters1/FAFLIST) }</ns0:P_FAFLIST>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarFAFTipo_Req($input_Parameters1)