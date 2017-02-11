(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_DUALMATRIX_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_DUALMATRIX.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://xmlns.oracle.com/DualMatrix/DS_DualMatrix";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/DualMatrixFact";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/dualMatrix";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/dualMatrix_Res/";

declare function xf:dualMatrix_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        <code>1</code>
            <message>
                <salesMatrixResult>{ $callFunctionStatelessDecision1/ns1:resultList/ns3:DualMatrixFactResponse/SalesMatrixResult[1]/@* , $callFunctionStatelessDecision1/ns1:resultList/ns3:DualMatrixFactResponse/SalesMatrixResult[1]/node() }</salesMatrixResult>
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:dualMatrix_Res($callFunctionStatelessDecision1)
