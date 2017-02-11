(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_VALIDATECFM_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_VALIDATECFM.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/ValidateCfm/DS_ValidateCfm";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/validateCFM";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/ValidateCfmFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/validateCFM_Res/";

declare function xf:validateCFM_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                {
                    for $CustomerOrder in $callFunctionStatelessDecision1/ns1:resultList/ns0:ValidateCfmFactResponse/CustomerOrder
                    return
                        <customerOrder>{ $CustomerOrder/@* , $CustomerOrder/node() }</customerOrder>
                }
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:validateCFM_Res($callFunctionStatelessDecision1)
