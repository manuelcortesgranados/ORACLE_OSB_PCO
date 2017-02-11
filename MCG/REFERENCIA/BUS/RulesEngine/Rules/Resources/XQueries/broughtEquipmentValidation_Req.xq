(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns7:Input_Parameters" location="../Schemas/PS_BROUGTHEQUIPMENTVALIDATION.xsd" ::)
(:: pragma bea:global-element-return element="ns5:callFunctionStateless" location="../Schemas/BR_BROUGTHEQUIPMENTVALIDATION_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns4 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://xmlns.oracle.com/BroughtEquipmentValidation/DS_BroughtEquipmentValidation";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/BroughtEquipmentValidationFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/broughtEquipmentValidation_Req/";
declare namespace ns7 = "http://www.claro.com.co/rulesEngine/broughtEquipmentValidation";

declare function xf:broughtEquipmentValidation_Req($input_Parameters1 as element(ns7:Input_Parameters))
    as element(ns5:callFunctionStateless) {
        <ns5:callFunctionStateless>
            <ns5:parameterList>
                <ns6:BroughtEquipmentValidationFactRequest>
                    <Product>{ $input_Parameters1/product/@* , $input_Parameters1/product/node() }</Product>
                    <CustomerBillingBehavior>{ $input_Parameters1/customerBillingBehavior/@* , $input_Parameters1/customerBillingBehavior/node() }</CustomerBillingBehavior>
                </ns6:BroughtEquipmentValidationFactRequest>
            </ns5:parameterList>
        </ns5:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns7:Input_Parameters) external;

xf:broughtEquipmentValidation_Req($input_Parameters1)
