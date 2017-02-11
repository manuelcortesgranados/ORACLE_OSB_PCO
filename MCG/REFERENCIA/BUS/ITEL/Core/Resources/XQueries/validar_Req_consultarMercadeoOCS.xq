(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_MERCADEO_OCS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarMercadeoOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarMercadeoOCS/";

declare function xf:validar_Req_consultarMercadeoOCS($codigoMaterial as xs:string, $tmcode as xs:string, $spcode as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CODIGO_MATERIAL>{ $codigoMaterial }</CODIGO_MATERIAL>
            <TMCODE>{ xs:decimal($tmcode) }</TMCODE>
            <SPCODE>{ xs:decimal($spcode) }</SPCODE>
        </ns0:Input_Parameters>
};

declare variable $codigoMaterial as xs:string external;
declare variable $tmcode as xs:string external;
declare variable $spcode as xs:string external;

xf:validar_Req_consultarMercadeoOCS($codigoMaterial, $tmcode, $spcode)