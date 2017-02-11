(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_CREDITEXCEPTIONS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_CREDITEXCEPTIONS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://xmlns.oracle.com/CreditExceptions/DS_CreditExceptions";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/creditExceptions";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/CreditExceptionssFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditExceptions_Res/";

declare function xf:creditExceptions_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns1:resultList/ns0:CreditExceptionsFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns1:resultList/ns0:CreditExceptionsFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:creditExceptions_Res($callFunctionStatelessDecision1)
