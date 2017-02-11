(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTADOR.xsd" ::)
(:: pragma bea:global-element-return element="ns2:Input_Parameters" location="../../../RTC/Resources/Schemas/PS_PROVISION_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ProvisionPaqueteDatosRTC/";
declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionOCS_AIR";
declare namespace ns4 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns3 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutar_Req_provisionPaqueteDatosRTC/";

declare function xf:ejecutar_Req_provisionPaqueteDatosRTC($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns2:Input_Parameters) {
        <ns2:Input_Parameters>
            <msisdn>{ data($input_Parameters1/MIN_DESTINO) }</msisdn>
            <activationRequest>
                <productId>{ data($input_Parameters1/PARAMETROS_TRAMA/PARAMETRO[NOMBRE="PAQUETERTC"]/VALOR) }</productId>
            </activationRequest>
        </ns2:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:ejecutar_Req_provisionPaqueteDatosRTC($input_Parameters1)
