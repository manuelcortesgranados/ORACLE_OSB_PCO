(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONDICIONESPROMO.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOCINE.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns1 = "http://www.comcel.com.co/consultarCondicionesPromo/";
declare namespace ns0 = "http://www.comcel.com.co/EnviarSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaPromo_enviaMensajePromoCine/";

declare function xf:consumirAuditoriaPromo_enviaMensajePromoCine($wS_Result1 as element(ns1:WS_Result),
    $input_Parameters1 as element(ns2:Input_Parameters),
    $mensaje as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
            <MENSAJE>{ data($mensaje) }</MENSAJE>
            <ORIGEN>799</ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $wS_Result1 as element(ns1:WS_Result) external;
declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;
declare variable $mensaje as xs:string external;

xf:consumirAuditoriaPromo_enviaMensajePromoCine($wS_Result1,
    $input_Parameters1,
    $mensaje)