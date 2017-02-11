(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_GET_EXCEPTION.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_FRAMEWORK/PRC_GET_EXCEPTION/";
declare namespace xf = "http://tempuri.org/RulesEngine/Framework/Resources/XQueries/getException_Req/";

declare function xf:getException_Req($exceptionId as xs:decimal)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_EXCEPTION_ID>{ $exceptionId }</ns0:P_EXCEPTION_ID>
        </ns0:InputParameters>
};

declare variable $exceptionId as xs:decimal external;

xf:getException_Req($exceptionId)
