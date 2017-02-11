(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../RTC/Resources/Schemas/PS_CONSULTAR_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ITEL/consultarPaqueteDatosRTC/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_consultarPaqueteDatosRTC/";

declare function xf:ejecutarReglasNegocio_Req_consultarPaqueteDatosRTC($mIN_DESTINO1 as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <msisdn>{ $mIN_DESTINO1 }</msisdn>
        </ns0:Input_Parameters>
};

declare variable $mIN_DESTINO1 as xs:string external;

xf:ejecutarReglasNegocio_Req_consultarPaqueteDatosRTC($mIN_DESTINO1)
