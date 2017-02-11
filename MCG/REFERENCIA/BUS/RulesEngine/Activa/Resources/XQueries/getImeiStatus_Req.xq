(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_GET_IMEISTATUSACTIVA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_GET_IMEISTATUSACTIVA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/INH_MOTORREGLAS/PKG_RULESENGINE_ACTIVA/PRC_GET_IMEI_ACTIVA/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/getImeiStatusActiva";
declare namespace xf = "http://tempuri.org/RulesEngine/Activa/Resources/XQueries/getImeiStatus_Req/";

declare function xf:getImeiStatus_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            {
                for $code in $input_Parameters1/product/code
                return
                    <ns1:P_IMEI>{ data($code) }</ns1:P_IMEI>
            }
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:getImeiStatus_Req($input_Parameters1)
