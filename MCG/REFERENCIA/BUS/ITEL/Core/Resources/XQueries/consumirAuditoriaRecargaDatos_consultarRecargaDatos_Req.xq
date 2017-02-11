(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRECARGADATOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRecargaDatos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaDatos_consultarRecargaDatos_Req/";

declare function xf:consumirAuditoriaRecargaDatos_consultarRecargaDatos_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <HOSTID>{ data($input_Parameters1/EVEHOSTID) }</HOSTID>
            <RECARGA>{ data($input_Parameters1/EVERECARGA) }</RECARGA>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consumirAuditoriaRecargaDatos_consultarRecargaDatos_Req($input_Parameters1)