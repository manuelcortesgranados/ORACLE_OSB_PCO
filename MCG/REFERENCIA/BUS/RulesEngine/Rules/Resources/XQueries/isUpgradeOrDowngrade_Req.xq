(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns7:Input_Parameters" location="../Schemas/PS_ISUPGRADEORDOWNGRADE.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_ISUPGRADEORDOWNGRADE_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/IsUpgradeOrDowngrade/DS_IsUpgradeOrDowngrade";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/IsUpgradeOrDowngradeFact/";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/isUpgradeOrDowngrade_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/isUpgradeOrDowngrade";

declare function xf:isUpgradeOrDowngrade_Req($input_Parameters1 as element(ns7:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name="DS_IsUpgradeOrDowngrade">
            <ns2:parameterList>
                <ns1:IsUpgradeOrDowngradeFactRequest>
                    {
                        for $customerOrder in $input_Parameters1/customerOrder
                        return
                            <CustomerOrder>{ $customerOrder/@* , $customerOrder/node() }</CustomerOrder>
                    }
                </ns1:IsUpgradeOrDowngradeFactRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns7:Input_Parameters) external;

xf:isUpgradeOrDowngrade_Req($input_Parameters1)
