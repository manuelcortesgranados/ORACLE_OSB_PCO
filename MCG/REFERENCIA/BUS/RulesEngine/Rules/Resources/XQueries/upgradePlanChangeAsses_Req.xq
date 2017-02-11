(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns3:Input_Parameters" location="../Schemas/PS_UPGRADEPLANCHANGEASSES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:callFunctionStateless" location="../Schemas/BR_UPGRADEPLANCHANGEASSES_MESSAGETYPES.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/UpgradePlanChangeAssess/DS_UpgradePlanChangeAssess";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/UpgradePlanChangeAssessFact/";
declare namespace ns4 = "http://xmlns.oracle.com/bpel";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/upgradePlanChangeAsses";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/upgradePlanChangeAsses_Req/";

declare function xf:upgradePlanChangeAsses_Req($input_Parameters1 as element(ns3:Input_Parameters))
    as element(ns2:callFunctionStateless) {
        <ns2:callFunctionStateless>
            <ns2:parameterList>
                <ns1:UpgradePlanChangeAssessFactRequest>
                    {
                        for $internalAccountBehavior in $input_Parameters1/internalAccountBehavior
                        return
                            <internalAccountBehavior>{ $internalAccountBehavior/@* , $internalAccountBehavior/node() }</internalAccountBehavior>
                    }
                    <ExceptionBusinessCollection>{ $input_Parameters1/exceptionBusinessCollection/@* , $input_Parameters1/exceptionBusinessCollection/node() }</ExceptionBusinessCollection>
                </ns1:UpgradePlanChangeAssessFactRequest>
            </ns2:parameterList>
        </ns2:callFunctionStateless>
};

declare variable $input_Parameters1 as element(ns3:Input_Parameters) external;

xf:upgradePlanChangeAsses_Req($input_Parameters1)
