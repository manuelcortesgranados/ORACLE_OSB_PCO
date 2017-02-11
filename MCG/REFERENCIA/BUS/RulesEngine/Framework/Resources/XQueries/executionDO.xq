(:: pragma bea:schema-type-parameter parameter="$auditExecution" type="ns0:AuditExecution" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma  type="anyType" ::)

declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Framework/Resources/XQueries/executionDO/";

declare function xf:executionDO($auditExecution as element())
    as element(*) {
    	<executions>
    	{
    		for $stepExecution in $auditExecution/execution
    		return
    			xf:processStepExecution($stepExecution)
    	}
    	</executions>
};

declare function xf:processStepExecution($stepExecution as element())
    as element()* {
    	xf:stepExecutionToDO($stepExecution),
    	for $innerStepExecution in $stepExecution/execution
    	return
    		xf:processStepExecution($innerStepExecution)
};

declare function xf:stepExecutionToDO($stepExecution as element())
    as element(*) {
    	let $serviceTokens := fn:tokenize(data($stepExecution/service/endpoint), '/')
    	return
	    	<executionDO>
	    		<platform>{ $serviceTokens[2] }</platform>
	    		<serviceId>{ data($stepExecution/service/id) }</serviceId>
	    		<service>{ $serviceTokens[4] }</service>
	    		<resultCode>{ data($stepExecution/resultCode) }</resultCode>
	    		<startExecution>{ data($stepExecution/startExecution) }</startExecution>
	    		<duration>{ data($stepExecution/duration) }</duration>
	    	</executionDO>
};

declare variable $auditExecution as element() external;

xf:executionDO($auditExecution)
