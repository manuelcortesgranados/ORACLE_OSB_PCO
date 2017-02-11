(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_UNIT_TYPE.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_UNIT_TYPE.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarUnitType/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_OFFERUNITTYPE/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarUnitType_Req/";

declare function xf:consultarUnitType_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_OFFERID>{ data($input_Parameters1/OFFERID) }</ns0:P_OFFERID>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarUnitType_Req($input_Parameters1)