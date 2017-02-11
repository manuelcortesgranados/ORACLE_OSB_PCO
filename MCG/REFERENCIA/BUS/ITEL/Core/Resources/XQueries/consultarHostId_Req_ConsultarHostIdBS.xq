(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARHOSTID.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARHOSTID.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/SOA_TEST/PKG_SOA_ITEL/PRC_CONSULTAR_HOSTID/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarHostId/";
declare namespace xf = "http://tempuri.org/ITEL/Resources/XQueries/consultarHostId_Req_ConsultarHostIdBS/";

declare function xf:consultarHostId_Req_ConsultarHostIdBS($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_HIDCODIGO>{ data($input_Parameters1/HIDCODIGO) }</ns1:P_HIDCODIGO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarHostId_Req_ConsultarHostIdBS($input_Parameters1)