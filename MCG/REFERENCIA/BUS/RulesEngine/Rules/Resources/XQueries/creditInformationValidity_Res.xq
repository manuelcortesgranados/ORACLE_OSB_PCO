(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../Schemas/BR_CREDITINFORMATIONVALIDITY_MESSAGETYPES.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_CREDITINFORMATIONVALIDITY.xsd" ::)

declare namespace ns2 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace ns1 = "http://xmlns.oracle.com/CreditInformationValidity/DS_CreditInformationValidity";
declare namespace ns3 = "http://www.claro.com.co/rulesEngine/CreditInformationValidity2Fact/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/creditInformationValidity";
declare namespace xf = "http://tempuri.org/RulesEngine/Rules/Resources/XQueries/creditInformationValidity_Res/";

declare function xf:creditInformationValidity_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<code>1</code>
            <message>
            {
               if(data($callFunctionStatelessDecision1/ns1:resultList/ns3:CreditInformationValidityFactResponse/Plan)) then	
                 <plan>{ $callFunctionStatelessDecision1/ns1:resultList/ns3:CreditInformationValidityFactResponse/Plan/@* , $callFunctionStatelessDecision1/ns1:resultList/ns3:CreditInformationValidityFactResponse/Plan/node() }</plan>
               else ()  
            }    
            </message>
            <description>Operacion Ejecutada</description>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:creditInformationValidity_Res($callFunctionStatelessDecision1)
