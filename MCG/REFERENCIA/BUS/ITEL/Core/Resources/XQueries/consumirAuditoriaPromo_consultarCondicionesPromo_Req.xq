(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOCINE.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONDICIONESPROMO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/consultarCondicionesPromo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaPromo_consultarCondicionesPromo_Req/";

declare function xf:consumirAuditoriaPromo_consultarCondicionesPromo_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MSISDN>{ data($input_Parameters1/EVEMIN) }</MSISDN>
            <VALOR_RECARGA>{ data($input_Parameters1/EVERECARGA) }</VALOR_RECARGA>
            <HOSTID>{ data($input_Parameters1/EVEHOSTID) }</HOSTID>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consumirAuditoriaPromo_consultarCondicionesPromo_Req($input_Parameters1)