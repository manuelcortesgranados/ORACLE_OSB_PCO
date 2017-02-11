(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns7:Input_Parameters" location="../Schemas/PS_DOWNGRADEGENERALVALIDATION.xsd" ::)
(:: pragma bea:global-element-return element="ns3:callFunctionStateless" location="../Schemas/BR_DOWNGRADEGENERALVALIDATION_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns3 = "http://xmlns.oracle.com/DowngradeGeneralValidation/DS_DowngradeGeneralValidation";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/DowngradeGeneralValidationFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/downgradeGeneralValidation_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/downgradeGeneralValidation";

declare function xf:downgradeGeneralValidation_Req($input_Parameters1 as element(ns7:Input_Parameters))
    as element(ns3:callFunctionStateless) {
        <ns3:callFunctionStateless>
            <ns3:parameterList>
                <ns5:DowngradeGeneralValidationFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                    <InternalAccountBehavior>{ $input_Parameters1/internalAccountBehavior/@* , $input_Parameters1/internalAccountBehavior/node() }</InternalAccountBehavior>
                </ns5:DowngradeGeneralValidationFactRequest>
            </ns3:parameterList>
        </ns3:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns7:Input_Parameters) external;

xf:downgradeGeneralValidation_Req($input_Parameters1)
