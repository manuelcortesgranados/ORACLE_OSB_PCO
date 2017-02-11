(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARTARIFAPREPAGO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTARTARIFAPREPAGO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL2/PRC_CONSULTAR_TARIFAPREPAGO/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consultarTarifasPrepago_Req/";

declare function xf:consultarTarifasPrepago_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_CONTRATO>{ data($input_Parameters1/CONTRATO) }</ns0:P_CONTRATO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarTarifasPrepago_Req($input_Parameters1)