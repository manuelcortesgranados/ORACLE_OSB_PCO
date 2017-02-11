(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns4:callFunctionStatelessDecision" location="../Schemas/BR_RETAILMATRIX_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns3:WS_Result" location="../Schemas/PS_RETAILMATRIX.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/RetailMatrixFact";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns4 = "http://xmlns.oracle.com/RetailMatrix/DS_RetailMatrix";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/retailMatrix";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/retailMatrix_Res/";

declare function xf:retailMatrix_Res($callFunctionStatelessDecision as element(ns4:callFunctionStatelessDecision))
    as element(ns3:WS_Result) {
        <ns3:WS_Result>
        {
        if(data($callFunctionStatelessDecision/ns4:resultList/ns2:RetailMatrixFactResponse/SalesMatrixResult[1])) then
            <code>1</code>
            else 
            <code>903</code>
            }
            <message>
                <SalesMatrixResult>{ $callFunctionStatelessDecision/ns4:resultList/ns2:RetailMatrixFactResponse/SalesMatrixResult[1]/@* , $callFunctionStatelessDecision/ns4:resultList/ns2:RetailMatrixFactResponse/SalesMatrixResult[1]/node() }</SalesMatrixResult>
            </message>
            <description>Operacion Ejecutada</description>
        </ns3:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns4:callFunctionStatelessDecision) external;

xf:retailMatrix_Res($callFunctionStatelessDecision)
