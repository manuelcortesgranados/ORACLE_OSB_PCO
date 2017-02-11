(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONTRACTTEMP_CONTRACT.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_CONTEMP_CONTRACT.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_CONTEMP_CONTRACT/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarContractTemp_Contract/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarContractTempContract_Req/";

declare function xf:consultarContractTempContract_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_SERVCLASS>{ data($input_Parameters1/P_SERVCLASS) }</ns1:P_SERVCLASS>
            <ns1:P_FAFIDGROUP>{ data($input_Parameters1/P_FAFIDGROUP) }</ns1:P_FAFIDGROUP>
            <ns1:P_CONTRACT>{ data($input_Parameters1/P_CONTRACT) }</ns1:P_CONTRACT>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarContractTempContract_Req($input_Parameters1)