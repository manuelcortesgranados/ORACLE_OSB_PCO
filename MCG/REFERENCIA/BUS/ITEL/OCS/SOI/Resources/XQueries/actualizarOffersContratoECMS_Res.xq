xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_ACTUALIZAR_OFFERS_CONTRACT.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/actualizarOffersContratoECMS_Res/";
declare namespace ns2 = "http://www.comcel.com.co/ActualizarOffersContratoOCS/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionTypesECMScontractPamPackageWrite";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_ECMS";

declare function xf:actualizarOffersContratoECMS_Res($mensaje as xs:string, $codigo as xs:string, $descripcion as xs:string)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
           <CODIGO>{ $codigo }</CODIGO>
           <MENSAJE>{ $mensaje }</MENSAJE>
           <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $mensaje as xs:string external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:actualizarOffersContratoECMS_Res($mensaje, $codigo, $descripcion)