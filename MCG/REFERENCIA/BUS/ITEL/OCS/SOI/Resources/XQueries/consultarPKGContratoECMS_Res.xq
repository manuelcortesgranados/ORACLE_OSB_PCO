xquery version "1.0" encoding "Cp1252";
(:: pragma bea:schema-type-parameter parameter="$contract" type="ns1:contractPamPackageReadResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_ECMS_CONTRACTPAMPACKAGEREAD.xsd" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_PKG_CONTRACT.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/OCS/AIR/Resources/XQueries/consultarPKGContratoECMS_Res/";
declare namespace ns2 = "http://www.comcel.com.co/ConsultarPKGContratoOCS/";
declare namespace ns1 = "http://ericsson.com/services/ws_cma3/contractpampackageread";
declare namespace ns0 = "http://www.comcel.com.co/OCS/OperacionOCS_ECMS";

declare function xf:consultarPKGContratoECMS_Res($contract as element(), $codigo as xs:string, $descripcion as xs:string)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
           <CODIGO>{ $codigo }</CODIGO>
           <MENSAJE>
                <CONSULTAR_PKG_CONTRACT>
                	<ns1:contractPAMPackageOutput>{ $contract//ns1:contractPamPackageReadResponse/ns1:contractPAMPackageOutput/@* , $contract//ns1:contractPamPackageReadResponse/ns1:contractPAMPackageOutput/node() }</ns1:contractPAMPackageOutput>
                </CONSULTAR_PKG_CONTRACT>
            </MENSAJE>
           <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $contract as element() external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarPKGContratoECMS_Res($contract, $codigo, $descripcion)