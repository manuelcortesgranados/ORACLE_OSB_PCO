(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../Schemas/PS_GET_STATUSICCIDSRM.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GetSerialStateInformationRequest" location="../Schemas/BS_GET_SERIALSTATUSINFORMATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getStatusIccidSrm";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://getserialstateinformation.selfmanagement.schema.amx.com";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getStatusIccidSrm/";

declare function xf:getStatusIccidSrm($input_Parameters1 as element(ns4:Input_Parameters))
    as element(ns0:GetSerialStateInformationRequest) {
        <ns0:GetSerialStateInformationRequest>
            {
                for $code in $input_Parameters1/product/code
                return
                    <ns0:iccid>{ data($code) }</ns0:iccid>
            }
        </ns0:GetSerialStateInformationRequest>
};

declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:getStatusIccidSrm($input_Parameters1)
