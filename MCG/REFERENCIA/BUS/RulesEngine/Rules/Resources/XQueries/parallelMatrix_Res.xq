(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns3:callFunctionStatelessDecision" location="../Schemas/BR_PARALLELMATRIX_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_PARALLELMATRIX.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/parallelMatrix";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns3 = "http://xmlns.oracle.com/ParallelMatrix/DS_ParallelMatrix";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/ParallelMatrixFact/";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/parallelMatrix_Res/";

declare function xf:parallelMatrix_Res($callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <code>1</code>
            <message>
                <exceptionBusinessCollection>{ $callFunctionStatelessDecision1/ns3:resultList/ns0:ParallelMatrixFactResponse/ExceptionBusinessCollection/@* , $callFunctionStatelessDecision1/ns3:resultList/ns0:ParallelMatrixFactResponse/ExceptionBusinessCollection/node() }</exceptionBusinessCollection>
            </message>
            <description>Operacion Ejecutada</description>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision) external;

xf:parallelMatrix_Res($callFunctionStatelessDecision1)
