(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOPAQUETESTAT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/EnviarSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaPromoPaqTAT_enviaSMSPromo/";

declare function xf:consumirAuditoriaPromoPaqTAT_enviaSMSPromo($input_Parameters1 as element(ns1:Input_Parameters),
    $mensaje as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
            <MENSAJE>{ $mensaje }</MENSAJE>
            <ORIGEN>799</ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $mensaje as xs:string external;

xf:consumirAuditoriaPromoPaqTAT_enviaSMSPromo($input_Parameters1,
    $mensaje)
