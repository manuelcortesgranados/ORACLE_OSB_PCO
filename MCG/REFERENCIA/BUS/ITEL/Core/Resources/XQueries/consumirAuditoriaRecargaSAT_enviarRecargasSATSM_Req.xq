(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGASAT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameter" location="../../../SAT/Resources/Schemas/PS_ENVIAR_RECARGAS_SAT_SM.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/EnviarRecargasSATSM/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaSAT_enviarRecargasSATSM_Req/";

declare function xf:consumirAuditoriaRecargaSAT_enviarRecargasSATSM_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameter) {
        <ns0:Input_Parameter>
            <ns0:EVEMIN>{ data($input_Parameters1/EVEMIN) }</ns0:EVEMIN>
            <ns0:EVERECARGA>{ data($input_Parameters1/EVERECARGA) }</ns0:EVERECARGA>
            <ns0:EVECONSECUTIVO>{ data($input_Parameters1/EVECONSECUTIVO) }</ns0:EVECONSECUTIVO>
            <ns0:EVEFECHARECARGA>{ data($input_Parameters1/EVEFECHARECARGA) }</ns0:EVEFECHARECARGA>
            <ns0:EVEHOSTID>{ data($input_Parameters1/EVEHOSTID) }</ns0:EVEHOSTID>
        </ns0:Input_Parameter>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consumirAuditoriaRecargaSAT_enviarRecargasSATSM_Req($input_Parameters1)
