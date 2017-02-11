(:: pragma bea:global-element-parameter parameter="$closeCEExceptionCaseRequest1" element="ns1:CloseCEExceptionCaseRequest" location="../Schemas/PS_CLOSECEEXCEPTIONCASE.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../Framework/Resources/Schemas/PS_RULES_ENGINE_MANAGER.xsd" ::)

declare namespace ns1 = "http://closeceexceptioncase.performancemanagement.schema.amx.com";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/manager";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/closeCeExceptionCase_Req_RulesManager/";

declare function xf:closeCeExceptionCase_Req_RulesManager($closeCEExceptionCaseRequest1 as element(ns1:CloseCEExceptionCaseRequest))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <process>PR</process>
            <operation>closeCeExceptionCase</operation>
            <entities>
			   <exceptionBusiness>
			        <id></id>
			        <code></code>
			        <description></description>
			        <exceptionBusinessType>
			            <id></id>
			            <code></code>
			            <description></description>
			        </exceptionBusinessType>
			        <causalOrder>causalOrder_1</causalOrder>
			        <caseId>{ data($closeCEExceptionCaseRequest1/ns1:caseId) }</caseId>
				    <cBPId>{data($closeCEExceptionCaseRequest1/ns1:cbpId)}</cBPId>
			        {
			        for $caseTypeLevels in $closeCEExceptionCaseRequest1/ns1:caseTypeLevels
			        return
			        <caseTypeLevels>{data($caseTypeLevels)}</caseTypeLevels>
			        }
			        {
			        for $closeStatus in $closeCEExceptionCaseRequest1/ns1:closeStatus
			        return
			        <closeStatus>
			            {$closeStatus/node()}
			        </closeStatus>
			        }
			        <resolutionCode1>{data($closeCEExceptionCaseRequest1/ns1:resolutionCode1)}</resolutionCode1>
			        <resolutionCode2>{data($closeCEExceptionCaseRequest1/ns1:resolutionCode2)}</resolutionCode2>
			        {
			        for $FlexibleAttributeVO in $closeCEExceptionCaseRequest1/ns1:FlexibleAttributeVO
			        return
			        <flexibleAttributes>
			        	<flexAttrName>{data($FlexibleAttributeVO/ns1:flexAttrName)}</flexAttrName>
			        	<flexAttriValue>{data($FlexibleAttributeVO/ns1:flexAttriValue)}</flexAttriValue>
			        </flexibleAttributes>
			        }
			        <agentId>{data($closeCEExceptionCaseRequest1/ns1:agentId)}</agentId>
			        <closeDate>{data($closeCEExceptionCaseRequest1/ns1:closeDate)}</closeDate>
			    </exceptionBusiness>
            </entities>
        </ns0:Input_Parameters>
};

declare variable $closeCEExceptionCaseRequest1 as element(ns1:CloseCEExceptionCaseRequest) external;

xf:closeCeExceptionCase_Req_RulesManager($closeCEExceptionCaseRequest1)
