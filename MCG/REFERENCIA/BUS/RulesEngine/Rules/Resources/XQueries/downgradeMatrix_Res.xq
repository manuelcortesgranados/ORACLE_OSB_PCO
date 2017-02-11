(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns3:callFunctionStatelessDecision" location="../Schemas/BR_DOWNGRADEMATRIX_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_DOWNGRADEMATRIX.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/DowngradeMatrixFact/";
declare namespace ns3 = "http://xmlns.oracle.com/DowngardeMatrix/DowngardeMatrix_DecisionService_1";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/downgradeMatrix";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/downgradeMatrix_Res/";

declare function xf:downgradeMatrix_Res($callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns3:resultList/ns1:DowngradeMatrixFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns3:resultList/ns1:DowngradeMatrixFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision) external;

xf:downgradeMatrix_Res($callFunctionStatelessDecision1)
