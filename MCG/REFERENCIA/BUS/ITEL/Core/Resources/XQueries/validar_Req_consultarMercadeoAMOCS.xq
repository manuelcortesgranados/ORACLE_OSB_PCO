(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_MERCADEO_AMD_OCS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarMercadeoAMOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarMercadeoAMOCS/";

declare function xf:validar_Req_consultarMercadeoAMOCS($codigoMaterial as xs:string, $offer as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CODIGO_MATERIAL>{ $codigoMaterial }</CODIGO_MATERIAL>
            <OFFER>{ $offer }</OFFER>
        </ns0:Input_Parameters>
};

declare variable $codigoMaterial as xs:string external;
declare variable $offer as xs:string external;

xf:validar_Req_consultarMercadeoAMOCS($codigoMaterial, $offer)