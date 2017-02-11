(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_PKG_CONTRACT.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarPKGContratoOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorOCS_Req_consultarPKGContratoECMS/";

declare function xf:crearSuscriptorOCS_Req_consultarPKGContratoECMS($publicContractID1 as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CONTRACTTEMPLATE>{ $publicContractID1 }</CONTRACTTEMPLATE>
        </ns0:Input_Parameters>
};

declare variable $publicContractID1 as xs:string external;

xf:crearSuscriptorOCS_Req_consultarPKGContratoECMS($publicContractID1)
