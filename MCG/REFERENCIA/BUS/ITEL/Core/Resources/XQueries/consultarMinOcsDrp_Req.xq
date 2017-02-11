(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_MIN_OCS_DRP.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_MIN_OCS_DRP.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarMinOcsDrp/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarMinOcsDrp";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarMinOcsDrp_Req/";

declare function xf:consultarMinOcsDrp_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarMinOcsDrp_Req($input_Parameters1)
