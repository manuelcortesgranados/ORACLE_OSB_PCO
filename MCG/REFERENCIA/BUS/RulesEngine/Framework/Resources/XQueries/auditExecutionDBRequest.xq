(:: pragma bea:schema-type-parameter parameter="$auditExecution" type="ns0:AuditExecution" location="../../../Core/Resources/Schemas/CanonicalModel/FrameworkDomain.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_AUDIT_EXECUTION.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_FRAMEWORK/PRC_AUDIT_EXECUTION/";
declare namespace ns0 = "http://www.claro.com.co/rulesEngine/canonicalModel/FrameworkDomain";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/auditExecutionDBRequest/";

declare function xf:auditExecutionDBRequest($auditExecution as element())
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_XML>{ $auditExecution }</ns1:P_XML>
        </ns1:InputParameters>
};

declare variable $auditExecution as element() external;

xf:auditExecutionDBRequest($auditExecution)