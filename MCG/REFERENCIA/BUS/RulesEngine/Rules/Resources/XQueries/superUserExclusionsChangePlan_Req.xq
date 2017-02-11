(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns4:Input_Parameters" location="../Schemas/PS_SUPERUSEREXCLUSIONSCHANGEPLAN.xsd" ::)
(:: pragma bea:global-element-return element="ns1:callFunctionStateless" location="../Schemas/BR_SUPERUSEREXCLUSIONSCHANGEPLAN_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/SuperUserExclusionsChangePlan/DS_SuperUserExclusionsChangePlan";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/superUserExclusionsChangePlan";
declare namespace ns3 = "http://xmlns.oracle.com/bpel";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/SuperUserExclusionChangePlanFact/";
declare namespace ns5 = "http://www.claro.com.co/rulesEngine/canonicalModel/MarketSalesDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/superUserExclusionsChangePlan_Req/";

declare function xf:superUserExclusionsChangePlan_Req($input_Parameters1 as element(ns4:Input_Parameters))
    as element(ns1:callFunctionStateless) {
        <ns1:callFunctionStateless name="DS_SuperUserExclusionChangePlan">
            <ns1:parameterList>
                {
                    let $exceptionBusinessCollection := $input_Parameters1/exceptionBusinessCollection
                    return
                        <ns0:SuperUserExclusionChangePlanRequest>
                            <ExceptionBusinessCollection>{ $input_Parameters1/SalesChannel/@*,$input_Parameters1/SalesChannel/node() }</ExceptionBusinessCollection>
                            <SalesChannel>{ $input_Parameters1/salesChannel/@* , $input_Parameters1/salesChannel/node() }</SalesChannel>
                        </ns0:SuperUserExclusionChangePlanRequest>
                }
            </ns1:parameterList>
        </ns1:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns4:Input_Parameters) external;

xf:superUserExclusionsChangePlan_Req($input_Parameters1)
