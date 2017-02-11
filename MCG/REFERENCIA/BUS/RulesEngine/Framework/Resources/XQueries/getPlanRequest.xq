(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_GET_PLAN.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_FRAMEWORK/PRC_GET_PLAN/";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/getPlanRequest/";

declare function xf:getPlanRequest($process as xs:string,
    $operation as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_PROCESS>{ $process }</ns0:P_PROCESS>
            <ns0:P_OPERATION>{ $operation }</ns0:P_OPERATION>
        </ns0:InputParameters>
};

declare variable $process as xs:string external;
declare variable $operation as xs:string external;

xf:getPlanRequest($process,
    $operation)