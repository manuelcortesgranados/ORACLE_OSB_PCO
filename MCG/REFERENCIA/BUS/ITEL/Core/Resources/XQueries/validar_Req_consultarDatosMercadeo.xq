(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARDATOSMERCADEO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarDatosMercadeo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarDatosMercadeo/";

declare function xf:validar_Req_consultarDatosMercadeo($codigoMaterial as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <ns0:CODMATERIAL>{ $codigoMaterial }</ns0:CODMATERIAL>
        </ns0:Input_Parameters>
};

declare variable $codigoMaterial as xs:string external;

xf:validar_Req_consultarDatosMercadeo($codigoMaterial)