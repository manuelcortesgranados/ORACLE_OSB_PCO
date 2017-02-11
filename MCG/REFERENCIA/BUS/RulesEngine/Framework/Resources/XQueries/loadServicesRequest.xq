(:: pragma bea:schema-type-parameter parameter="$plan" type="ns1:Plan" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_LOAD_SERVICES.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/services";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/loadServicesRequest/";

declare function xf:loadServicesRequest($plan as element())
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <plan>
                {
                    for $service in $plan/service
                    return
                        <service>{ $service/@* , $service/node() }</service>
                }
            </plan>
        </ns0:Input_Parameters>
};

declare variable $plan as element() external;

xf:loadServicesRequest($plan)
