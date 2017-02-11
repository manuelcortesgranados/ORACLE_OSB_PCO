(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns7:Input_Parameters" location="../Schemas/PS_UPGRADEGENERALVALIDATIONS.xsd" ::)
(:: pragma bea:global-element-return element="ns4:callFunctionStateless" location="../Schemas/BR_UPGRADEGENERALVALIDATIONS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/UpgradeGeneralValidationsFact/";
declare namespace ns4 = "http://xmlns.oracle.com/UpgradeGeneralValidations/DS_UpgradeGeneralValidations";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/upgradeGeneralValidations_Req/";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/upgradeGeneralValidations";

declare function xf:upgradeGeneralValidations_Req($input_Parameters1 as element(ns7:Input_Parameters))
    as element(ns4:callFunctionStateless) {
        <ns4:callFunctionStateless name="DS_UpgradeGeneralValidations">
            <ns4:parameterList>
                <ns1:UpgradeGeneralValidationsFactRequest>
                    <InternalAccountBehavior>{ $input_Parameters1/internalAccountBehavior/@* , $input_Parameters1/internalAccountBehavior/node() }</InternalAccountBehavior>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                </ns1:UpgradeGeneralValidationsFactRequest>
            </ns4:parameterList>
        </ns4:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns7:Input_Parameters) external;

xf:upgradeGeneralValidations_Req($input_Parameters1)
