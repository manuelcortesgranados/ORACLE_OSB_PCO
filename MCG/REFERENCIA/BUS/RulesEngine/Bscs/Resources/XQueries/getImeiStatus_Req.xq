(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_GET_IMEISTATUSBSCS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_GET_IMEISTATUSBSCS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/getImeiStatusBscs";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_RULESENGINE_BSCS/PRC_GET_IMEI_BSCS/";
declare namespace xf = "http://tempuri.org/RulesEngine/Bscs/Resources/XQueries/getImeiStatus_Req/";

declare function xf:getImeiStatus_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            {
                for $code in $input_Parameters1/product/code
                return
                    <ns0:P_IMEI>{ data($code) }</ns0:P_IMEI>
            }
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:getImeiStatus_Req($input_Parameters1)
