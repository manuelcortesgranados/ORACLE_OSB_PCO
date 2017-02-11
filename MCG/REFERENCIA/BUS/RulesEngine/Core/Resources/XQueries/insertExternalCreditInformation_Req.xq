(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_INSERT_EXTERNALCREDITINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_INSERT_EXTERNALCREDITINFORMATION.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINEDEV/PKG_RULESENGINE/PRC_INSERT_EXT_CREDIT_INFO_XML/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/insertExternalCreditInformation";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/insertExternalCreditInformation_Req/";

declare function xf:insertExternalCreditInformation_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            {
                <ns1:P_REPORT>{ $input_Parameters1/P_REPORT/*}</ns1:P_REPORT>             
                    
                    
            }
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:insertExternalCreditInformation_Req($input_Parameters1)
