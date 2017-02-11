(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGAESCALERA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRECARGAESCALERA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRecargaEscalera/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaEscalera_consultarRecargaEscalera_Req/";

declare function xf:consumirAuditoriaRecargaEscalera_consultarRecargaEscalera_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <HOSTIDIN>{ data($input_Parameters1/EVEHOSTID) }</HOSTIDIN>
            <RECARGA>{ data($input_Parameters1/EVERECARGA) }</RECARGA>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consumirAuditoriaRecargaEscalera_consultarRecargaEscalera_Req($input_Parameters1)