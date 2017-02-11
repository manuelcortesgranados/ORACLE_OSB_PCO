(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/PS_GENERALVALIDATIONS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:callFunctionStateless" location="../Schemas/BR_GENERALVALIDATIONS_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/generalValidations";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/GeneralValidationsFact/";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns0 = "http://xmlns.oracle.com/GeneralValidations/DS_GeneralValidations";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/generalValidations_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";

declare function xf:generalValidations_Req($input_Parameters1 as element(ns2:Input_Parameters))
    as element(ns0:callFunctionStateless) {
        <ns0:callFunctionStateless name = "DS_GeneralValidations">
            <ns0:parameterList>
                <ns4:GeneralValidationsFactRequest>
                    {
                        for $internalAccountBehavior in $input_Parameters1/internalAccountBehavior
                        return
                            <InternalAccountBehavior>{ $internalAccountBehavior/@* , $internalAccountBehavior/node() }</InternalAccountBehavior>
                    }
                    {
                        for $product in $input_Parameters1/product
                        return
                            <Product>{ $product/@* , $product/node() }</Product>
                    }
                    {
                        for $customerOrder in $input_Parameters1/customerOrder
                        return
                            <CustomerOrder>{ $customerOrder/@* , $customerOrder/node() }</CustomerOrder>
                    }
                    <CustomerDocument>{ $input_Parameters1/customerDocument/@* , $input_Parameters1/customerDocument/node() }</CustomerDocument>
                </ns4:GeneralValidationsFactRequest>
            </ns0:parameterList>
        </ns0:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;

xf:generalValidations_Req($input_Parameters1)
