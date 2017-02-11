(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_NOCREDITANALYSISMATRIX_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_NOCREDITANALYSISMATRIX.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/NoCreditAnalysisMatrixFact/";
declare namespace ns1 = "http://xmlns.oracle.com/NoCreditAnalysisMatrix/DS_NoCreditAnalysisMatrix";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/noCreditAnalysisMatrix";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/noCreditAnalysisMatrix_Res/";

declare function xf:noCreditAnalysisMatrix_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<code>1</code>
            <message>
                <salesMatrixResult>{ $callFunctionStatelessDecision1/ns1:resultList/ns2:NoCreditAnalysisMatrixFactFactResponse/SalesMatrixResult[1]/@* , $callFunctionStatelessDecision1/ns1:resultList/ns2:NoCreditAnalysisMatrixFactFactResponse/SalesMatrixResult[1]/node() }</salesMatrixResult>
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:noCreditAnalysisMatrix_Res($callFunctionStatelessDecision1)
