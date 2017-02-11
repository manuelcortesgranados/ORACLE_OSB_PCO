(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARMETODO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARMETODO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_METODO/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarMetodos/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarMetodo_Req_consultarMetodoBS/";

declare function xf:consultarMetodo_Req_consultarMetodoBS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_CMCODIGOMETODO>{ data($input_Parameters1/CMCODIGOMETODO) }</ns1:P_CMCODIGOMETODO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarMetodo_Req_consultarMetodoBS($input_Parameters1)