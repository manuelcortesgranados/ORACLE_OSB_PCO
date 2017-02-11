(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../../../../../RulesEngine/Computec/Resources/Schemas/PS_GET_EXTERNALDEMOGRAPHICINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../../../../../RulesEngine/Computec/Resources/Schemas/PS_GET_EXTERNALDEMOGRAPHICINFORMATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/getExternalDemographicInformation";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Dummies/Resources/XQueries/getExternalDemographicInformation_Res/";

declare function xf:getExternalDemographicInformation_Res($input_Parameters1 as element(ns4:Input_Parameters))
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
            <code>1</code>
            <message>
                <customer>{ $input_Parameters1/customer/@* , $input_Parameters1/customer/node() }</customer>
            </message>
            <description>Operacion ejecutada</description>
        </ns4:WS_Result>
};

declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:getExternalDemographicInformation_Res($input_Parameters1)
