(:: pragma bea:schema-type-parameter parameter="$auditExecution" type="ns0:AuditExecution" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_AUDIT_EXECUTION.xsd" ::)

declare namespace ns1 = "http://www.claro.com.co/rulesEngine/auditExecution";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/auditExecutionRequest/";

declare function xf:auditExecutionRequest($auditExecution as element())
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            {
                <execution>{ $auditExecution/node() }</execution>
            }
        </ns1:Input_Parameters>
};

declare variable $auditExecution as element() external;

xf:auditExecutionRequest($auditExecution)