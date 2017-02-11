(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_LIBERARMSISDN_ECMS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_LIBERARMSISDN_ECMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/LiberarMsisdn_ECMS/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_liberarMsisdnECMS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/liberarMsisdnECMS_Req/";

declare function xf:liberarMsisdnECMS_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:MSISDN>{ data($input_Parameters1/MSISDN) }</ns0:MSISDN>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:liberarMsisdnECMS_Req($input_Parameters1)