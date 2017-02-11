(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARFAFIDVIGENCIA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_FAFIDVIGENCIA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarFAFIDVigencia";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_FAFID_VIGENCIA/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFAFIDVigencia_Req/";

declare function xf:consultarFAFIDVigencia_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_SERVICECLASS>{ data($input_Parameters1/SERVICECLASS) }</ns0:P_SERVICECLASS>
            <ns0:P_TIPOFAF>{ data($input_Parameters1/TIPO) }</ns0:P_TIPOFAF>
            <ns0:P_VIGENCIA>{ data($input_Parameters1/VIGENCIA) }</ns0:P_VIGENCIA>
            <ns0:P_FAFIDGROUP>{ data($input_Parameters1/FAFIDGROUP) }</ns0:P_FAFIDGROUP>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarFAFIDVigencia_Req($input_Parameters1)