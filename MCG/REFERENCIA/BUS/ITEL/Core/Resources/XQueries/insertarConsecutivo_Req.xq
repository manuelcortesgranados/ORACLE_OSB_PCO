(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_CONSECUTIVO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_CONSECUTIVO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/insertarConsecutivo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_CONSECUTIVO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarConsecutivo_Req/";

declare function xf:insertarConsecutivo_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_CONSECUTIVO>{ data($input_Parameters1/CONSECUTIVO) }</ns0:P_CONSECUTIVO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarConsecutivo_Req($input_Parameters1)