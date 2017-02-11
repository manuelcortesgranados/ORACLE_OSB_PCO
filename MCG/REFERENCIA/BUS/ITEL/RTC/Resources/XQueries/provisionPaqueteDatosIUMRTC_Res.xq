(:: pragma bea:global-element-parameter parameter="$ReAuthorizationRequestResponse1" element="ns1:ReAuthorizationRequestResponse" location="../Schemas/BS_PROVISION_PAQUETE_DATOS_IUM_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_PROVISION_PAQUETE_DATOS_IUM_RTC.xsd" ::)

declare namespace ns1 = "http://events.redirect.hp.com";
declare namespace ns0 = "http://www.comcel.com.co/ITEL/provisionPaqueteDatosIUMRTC/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/provisionPaqueteDatosIUMRTC_Res/";

declare function xf:provisionPaqueteDatosIUMRTC_Res($ReAuthorizationRequestResponse1 as element(ns1:ReAuthorizationRequestResponse))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                {
                        <ReAuthorizationRequestReturn>{ data($ReAuthorizationRequestResponse1/*:ReAuthorizationRequestReturn) }</ReAuthorizationRequestReturn>
                }
            </MENSAJE>
            <DESCRIPCION>Operacion Ejecutada</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $ReAuthorizationRequestResponse1 as element(ns1:ReAuthorizationRequestResponse) external;

xf:provisionPaqueteDatosIUMRTC_Res($ReAuthorizationRequestResponse1)