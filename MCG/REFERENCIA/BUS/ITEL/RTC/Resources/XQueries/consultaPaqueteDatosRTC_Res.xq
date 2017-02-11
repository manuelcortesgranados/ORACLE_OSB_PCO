(:: pragma bea:global-element-parameter parameter="$sendSmsSubscriberInformationResponse" element="ns1:sendSmsSubscriberInformationResponse" location="../Schemas/BS_CONSULTA_PAQUETE_DATOS_RTC.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_CONSULTAR_PAQUETE_DATOS_RTC.xsd" ::)

declare namespace ns1 = "http://axis.brms.hp.com";
declare namespace ns0 = "http://www.comcel.com.co/ITEL/consultarPaqueteDatosRTC/";
declare namespace xf = "http://tempuri.org/ITEL/RTC/Resources/XQueries/consultarPaqueteDatosRTC_Res/";

declare function xf:consultarPaqueteDatosRTC_Res($sendSmsSubscriberInformationResponse as element(ns1:sendSmsSubscriberInformationResponse))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>
                {
                    for $return in fn:tokenize($sendSmsSubscriberInformationResponse/*:return/*:errorDescription, '\|')                    
                    return
                        <PAQUETE>
                           <NOMBRE>{ data(fn:tokenize($return,';')[1]) }</NOMBRE>
                           <CONSUMO>{ data(fn:tokenize($return,';')[2]) }</CONSUMO>
                           <FECHA_EXPIRACION>{ if (data(fn:tokenize($return,';')[3]) != "" ) then concat(data(fn:tokenize($return,';')[3]), ":59") else ""  }</FECHA_EXPIRACION>
                           <TIPO>{ data(fn:tokenize($return,';')[4]) }</TIPO>
                        </PAQUETE>
                }
            </MENSAJE>
            <DESCRIPCION>Operacion Ejecutada</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $sendSmsSubscriberInformationResponse as element(ns1:sendSmsSubscriberInformationResponse) external;

xf:consultarPaqueteDatosRTC_Res($sendSmsSubscriberInformationResponse)
