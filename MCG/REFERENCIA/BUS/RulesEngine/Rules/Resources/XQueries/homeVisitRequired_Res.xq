(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../Schemas/BR_HOMEVISITREQUIRED_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_HOMEVISITREQUIRED.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/HomeVisitRequired/DS_HomeVisitRequired";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CustomerDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/homeVisitRequired";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/HomeVisitRequiredFact";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/homeVisitRequired_Res/";

declare function xf:homeVisitRequired_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <homeVisitRequired>{ $callFunctionStatelessDecision1/ns2:resultList/ns0:HomeVisitRequiredFactResponse/HomeVisitRequired/@* , $callFunctionStatelessDecision1/ns2:resultList/ns0:HomeVisitRequiredFactResponse/HomeVisitRequired/node() }</homeVisitRequired>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:homeVisitRequired_Res($callFunctionStatelessDecision1)
