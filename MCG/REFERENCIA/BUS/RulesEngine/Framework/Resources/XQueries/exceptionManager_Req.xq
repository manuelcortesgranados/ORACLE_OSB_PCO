(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_EXCEPTION_MANAGER.xsd" ::)

declare namespace ns0 = "http://www.claro.com.co/rulesEngine/exceptionManager";
declare namespace xf = "http://tempuri.org/RulesEngine/Framework/Resources/XQueries/exceptionManager_Req/";

declare function xf:exceptionManager_Req($exceptionCode as xs:string,
    $exceptionDetail as xs:string,
    $operation as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <operation>{ $operation }</operation>
            <exceptionCode>{ $exceptionCode }</exceptionCode>
            <exceptionDetail>{ $exceptionDetail }</exceptionDetail>
        </ns0:Input_Parameters>
};

declare variable $exceptionCode as xs:string external;
declare variable $exceptionDetail as xs:string external;
declare variable $operation as xs:string external;

xf:exceptionManager_Req($exceptionCode,
    $exceptionDetail,
    $operation)
