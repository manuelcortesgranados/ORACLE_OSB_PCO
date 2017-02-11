xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTARCUENTASOCSPAQ.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCuentasOCSPAQ_Req/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarCuentasOCSPaq";

declare function xf:consultarCuentasOCSPAQ_Req()
as element(ns0:InputParameters) {
    <ns0:InputParameters/>
};


xf:consultarCuentasOCSPAQ_Req()
