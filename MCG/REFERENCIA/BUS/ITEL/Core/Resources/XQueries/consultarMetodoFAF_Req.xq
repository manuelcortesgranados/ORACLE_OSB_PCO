(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARTIPOFAF.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_TIPOFAF.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_TIPOFAF/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarTipoFAF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarTipoFAF_Req/";

declare function xf:consultarTipoFAF_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_TIPO>{ data($input_Parameters1/TIPO) }</ns1:P_TIPO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarTipoFAF_Req($input_Parameters1)