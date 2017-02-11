(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns0:callFunctionStatelessDecision" location="../Schemas/BR_SALESMATRIX_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_SALESMATRIX.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/salesMatrix";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/SalesMatrixFact";
declare namespace ns0 = "http://xmlns.oracle.com/SalesMatrix/DS_SalesMatrix";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/salesMatrix_Res/";

declare function xf:salesMatrix_Res($callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        	<code>1</code>
            <message>
                <plan>{ $callFunctionStatelessDecision/ns0:resultList/ns3:SalesMatrixFactResponse/Plan/@* , $callFunctionStatelessDecision/ns0:resultList/ns3:SalesMatrixFactResponse/Plan/node() }</plan>
            </message>
            <description>Operacion Ejecutada</description>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision) external;

xf:salesMatrix_Res($callFunctionStatelessDecision)