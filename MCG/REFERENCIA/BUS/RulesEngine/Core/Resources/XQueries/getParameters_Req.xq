(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_GET_PARAMETERS.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/getParameters";
declare namespace xf = "http://tempuri.org/RulesEngine/Core/Resources/XQueries/getParameters_Req/";

declare function xf:getParameters_Req($platform as xs:string)
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_PLATFORM>{ $platform }</ns0:P_PLATFORM>
        </ns0:InputParameters>
};

declare variable $platform as xs:string external;

xf:getParameters_Req($platform)
