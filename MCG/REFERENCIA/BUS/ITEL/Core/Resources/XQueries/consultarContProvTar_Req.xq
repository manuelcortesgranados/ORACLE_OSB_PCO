(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTPROVTAR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTPROVTAR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarContProvTar/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTPROVTAR/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContProvTar_Req/";

declare function xf:consultarContProvTar_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_SERVCLASS>{ data($input_Parameters1/SERVICE_CLASS) }</ns0:P_SERVCLASS>
            <ns0:P_FAFIDGROUP>{ data($input_Parameters1/FAFIDGROUP) }</ns0:P_FAFIDGROUP>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarContProvTar_Req($input_Parameters1)