(:: pragma bea:global-element-parameter parameter="$input_Parameters" element="ns2:Input_Parameters" location="../../../../../RulesEngine/Amdocs/Resources/Schemas/PS_GET_CLIENTFINANCIALINFORMATION.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../../../../../RulesEngine/Amdocs/Resources/Schemas/PS_GET_CLIENTFINANCIALINFORMATION.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/getClientFinancialInformation";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Amdocs/Resources/XQueries/getClientFinancialInformationTemp2_Res/";

declare function xf:getClientFinancialInformationTemp2_Res($input_Parameters as element(ns2:Input_Parameters))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <code>1</code>
            <message>
                <customer>{ $input_Parameters/customer/@* , $input_Parameters/customer/node() }</customer>
            </message>
            <description>Success</description>
        </ns2:WS_Result>
};

declare variable $input_Parameters as element(ns2:Input_Parameters) external;

xf:getClientFinancialInformationTemp2_Res($input_Parameters)
