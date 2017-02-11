(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_GET_IMEISTATUSAMDOCS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetSerialStateInformationRequest" location="../Schemas/BS_GET_SERIALSTATUSINFORMATION.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/getImeiStatusAmdocs";
declare namespace ns0 = "http://getserialstateinformation.selfmanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getImeiStatus_Req/";

declare function xf:getImeiStatus_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:GetSerialStateInformationRequest) {
        <ns0:GetSerialStateInformationRequest>
            {
                for $code in $input_Parameters1/product/code
                return
                    <ns0:imei>{ data($code) }</ns0:imei>
            }
        </ns0:GetSerialStateInformationRequest>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:getImeiStatus_Req($input_Parameters1)
