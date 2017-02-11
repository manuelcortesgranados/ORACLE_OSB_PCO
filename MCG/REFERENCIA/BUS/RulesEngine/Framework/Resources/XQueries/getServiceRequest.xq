(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_GET_SERVICE.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/RULESENGINE/PKG_RULESENGINE/PRC_CONSULTAR_SERVICIO/";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/getServiceRequest/";

declare function xf:getServiceRequest($endpoint as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_ENDPOINT>{ $endpoint }</ns0:P_ENDPOINT>
        </ns0:InputParameters>
};

declare variable $endpoint as xs:string external;

xf:getServiceRequest($endpoint)