xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:CloseCEExceptionCaseResponse" location="../../../../../RulesEngine/Core/Resources/Schemas/PS_CLOSECEEXCEPTIONCASE.xsd" ::)

declare namespace xf = "http://tempuri.org/RulesEngine/Dummies/Resources/XQueries/closeCeExceptionCaseDummy_Res/";
declare namespace ns0 = "http://closeceexceptioncase.performancemanagement.schema.amx.com";

declare function xf:closeCeExceptionCaseDummy_Res()
as element(ns0:CloseCEExceptionCaseResponse) {
    <ns0:CloseCEExceptionCaseResponse/>
};


xf:closeCeExceptionCaseDummy_Res()
