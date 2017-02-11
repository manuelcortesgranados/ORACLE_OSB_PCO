(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPROVTAR.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARPROVTAR.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_PROV_TAR/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarProvTar/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarProvTar_Req/";

declare function xf:consultarProvTar_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CONTRACT>{ data($input_Parameters1/CONTRATO) }</ns1:P_CONTRACT>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarProvTar_Req($input_Parameters1)