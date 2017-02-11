(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns3:callFunctionStatelessDecision" location="../Schemas/BR_INSTALLMENTMATRIX_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_INSTALLMENTMATRIX.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/InstallmentMatrixFact/";
declare namespace ns3 = "http://xmlns.oracle.com/InstallmentMatrix/InstallmentMatrix_DS_InstallmentMatrix";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/installmentMatrix";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/installmentMatrix_Res/";

declare function xf:installmentMatrix_Res($callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <code>1</code>
            <message>
                <salesMatrixResult>{ $callFunctionStatelessDecision1/ns3:resultList/ns1:InstallmentMatrixFactResponse/salesMatrixResult[1]/@* , $callFunctionStatelessDecision1/ns3:resultList/ns1:InstallmentMatrixFactResponse/salesMatrixResult[1]/node() }</salesMatrixResult>
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns3:callFunctionStatelessDecision) external;

xf:installmentMatrix_Res($callFunctionStatelessDecision1)
