(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_NOTIFICACION_SMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/NotificacionSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/notificacionSMS_Res/";

declare function xf:notificacionSMS_Res($resultado as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>1</CODIGO>
            <MENSAJE>{ $resultado }</MENSAJE>
            <DESCRIPCION>{ $resultado }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $resultado as xs:string external;

xf:notificacionSMS_Res($resultado)
