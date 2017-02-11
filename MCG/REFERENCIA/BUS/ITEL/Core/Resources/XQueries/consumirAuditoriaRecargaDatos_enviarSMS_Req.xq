(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ENVIAR_SMS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/EnviarSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaDatos_enviarSMS_Req/";

declare function xf:consumirAuditoriaRecargaDatos_enviarSMS_Req($input_Parameters1 as element(ns1:Input_Parameters), $bono as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
            <MENSAJE>{ fn:replace(fn:replace(fn:tokenize($bono,'\|')[1] , 'FFFF', fn-bea:dateTime-to-string-with-format("dd/MM/yyyy", 
            			fn-bea:dateTime-from-string-with-format("yyyy-MM-dd'T'HH:mm:ss", fn:substring($input_Parameters1/EVEFECHARECARGA,1,19))+xdt:dayTimeDuration(concat("P", fn:tokenize($bono,'\|')[2], "D"))))
            			,'HHHH',fn-bea:dateTime-to-string-with-format("HH:mm", fn-bea:dateTime-from-string-with-format("yyyy-MM-dd'T'HH:mm:ss",
            			 fn:substring($input_Parameters1/EVEFECHARECARGA,1,19)))) }</MENSAJE>
            <ORIGEN>799</ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $bono as xs:string external;

xf:consumirAuditoriaRecargaDatos_enviarSMS_Req($input_Parameters1, $bono)
