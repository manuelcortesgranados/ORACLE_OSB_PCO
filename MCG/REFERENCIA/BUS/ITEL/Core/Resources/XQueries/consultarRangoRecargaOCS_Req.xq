(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_RANGORECARGA_OCS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_RANGORECARGA_OCS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoRecargaOCS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_RANGORECARGA_OCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRangoRecargaOCS_Req/";

declare function xf:consultarRangoRecargaOCS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_VALOR>{ data($input_Parameters1/VALOR) }</ns0:P_VALOR>
            <ns0:P_CONBONO>{ data($input_Parameters1/BONO) }</ns0:P_CONBONO>
            <ns0:P_REGLA>{ data($input_Parameters1/REGLA) }</ns0:P_REGLA>
            <ns0:P_SC>{ data($input_Parameters1/SC) }</ns0:P_SC>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarRangoRecargaOCS_Req($input_Parameters1)