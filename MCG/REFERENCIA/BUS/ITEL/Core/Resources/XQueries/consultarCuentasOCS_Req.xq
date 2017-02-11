xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTARCUENTASOCS.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCuentasOCS_Req/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarCuentasOCS";

declare function xf:consultarCuentasOCS_Req()
as element(ns0:InputParameters) {
    <ns0:InputParameters/>
};


xf:consultarCuentasOCS_Req()