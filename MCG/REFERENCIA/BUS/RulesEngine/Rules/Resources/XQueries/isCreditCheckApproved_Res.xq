(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns0:callFunctionStatelessDecision" location="../Schemas/BR_ISCREDITCHECKAPPROVED_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns4:WS_Result" location="../Schemas/PS_ISCREDITCHECKAPPROVED.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/isCreditCheckApproved";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/CreditCheckApprovedFact/";
declare namespace ns0 = "http://xmlns.oracle.com/IsCreditCheckApproved/DS_IsCreditCheckApproved";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/isCreditCheckApproved_Res/";

declare function xf:isCreditCheckApproved_Res($callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision))
    as element(ns4:WS_Result) {
        <ns4:WS_Result>
            <code>1</code>
            <message>
                <plan>{ $callFunctionStatelessDecision1/ns0:resultList/ns3:CreditCheckApprovedFactResponse/Plan/@* , $callFunctionStatelessDecision1/ns0:resultList/ns3:CreditCheckApprovedFactResponse/Plan/node() }</plan>
                <parameterCollection>{ $callFunctionStatelessDecision1/ns0:resultList/ns3:CreditCheckApprovedFactResponse/ParameterCollection/@* , $callFunctionStatelessDecision1/ns0:resultList/ns3:CreditCheckApprovedFactResponse/ParameterCollection/node() }</parameterCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns4:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision) external;

xf:isCreditCheckApproved_Res($callFunctionStatelessDecision1)
