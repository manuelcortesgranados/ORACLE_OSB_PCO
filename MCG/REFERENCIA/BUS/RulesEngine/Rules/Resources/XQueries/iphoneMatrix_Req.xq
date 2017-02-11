(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_IPHONEMATRIX.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_IPHONEMATRIX_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/IphoneMatrix/DS_IphoneMatrix";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/iphoneMatrix";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/IphoneMatrixFact";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/iphoneMatrix_Req/";
declare namespace ns6 = "http://xmlns.oracle.com/bpel";

declare function xf:iphoneMatrix_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless name = "DS_IphoneMatrix">
            <ns2:parameterList>
                <ns3:IphoneMatrixFactRequest>
                    <Zone>{ $input_Parameters1/zone/@* , $input_Parameters1/zone/node() }</Zone>
                    <CustomerBillingBehavior>{ $input_Parameters1/customerBillingBehavior/@* , $input_Parameters1/customerBillingBehavior/node() }</CustomerBillingBehavior>
                    <InternalAccountBehavior>{ $input_Parameters1/internalAccountBehavior/@* , $input_Parameters1/internalAccountBehavior/node() }</InternalAccountBehavior>
                    <DocumentType>{ $input_Parameters1/documentType/@* , $input_Parameters1/documentType/node() }</DocumentType>
                    <ProductUsage>{ $input_Parameters1/productUsage/@* , $input_Parameters1/productUsage/node() }</ProductUsage>
                </ns3:IphoneMatrixFactRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:iphoneMatrix_Req($input_Parameters1)