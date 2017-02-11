(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns0:callFunctionStatelessDecision" location="../Schemas/BR_REQUIREDDOCUMENTS_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_REQUIREDDOCUMENTS.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/CommonBusinessEntities";
declare namespace ns1 = "http://www.claro.com.co/rulesEngine/requiredDocuments";
declare namespace ns4 = "http://www.claro.com.co/rulesEngine/RequiredDocumentsFact";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/canonicalModel/ProductDomain";
declare namespace ns0 = "http://xmlns.oracle.com/RequiredDocuments/DS_RequiredDocuments";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/requiredDocuments_Res/";

declare function xf:requiredDocuments_Res($callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	<code>1</code>
            <message>
                {
                    for $RequiredDocuments in $callFunctionStatelessDecision/ns0:resultList/ns4:RequiredDocumentsFactResponse/RequiredDocuments
                    return
                        <requiredDocuments>{ $RequiredDocuments/@* , $RequiredDocuments/node() }</requiredDocuments>
                }
            </message>
            <description>Operacion Ejecutada</description>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision) external;

xf:requiredDocuments_Res($callFunctionStatelessDecision)
