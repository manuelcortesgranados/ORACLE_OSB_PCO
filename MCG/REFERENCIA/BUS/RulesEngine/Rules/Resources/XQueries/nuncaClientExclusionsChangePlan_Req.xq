(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_NUNCACLIENTEXCLUSIONSCHANGEPLAN.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_NUNCACLIENTEXCLUSIONSCHANGEPLAN_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/NuncaClientExclusionChangePlan/DS_NuncaClientExclusionChangePlan";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/nuncaClientExclusionsChangePlan";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/SupplierDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns6 = "http://www.claro.com.co/rulesEngine/NuncaClientExclusionChangePlanFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/nuncaClientExclusionsChangePlan_Req/";
declare namespace ns7 = "http://xmlns.oracle.com/bpel";

declare function xf:nuncaClientExclusionsChangePlan_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless>
            <ns2:parameterList>
                <ns6:NuncaClientExclusionChangePlanRequest>
                    <ExceptionBusinessCollection>{ $input_Parameters1/exceptionBusinessCollection/@* , $input_Parameters1/exceptionBusinessCollection/node() }</ExceptionBusinessCollection>
                    <Customer>{ $input_Parameters1/customer/@* , $input_Parameters1/customer/node() }</Customer>
                </ns6:NuncaClientExclusionChangePlanRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:nuncaClientExclusionsChangePlan_Req($input_Parameters1)
