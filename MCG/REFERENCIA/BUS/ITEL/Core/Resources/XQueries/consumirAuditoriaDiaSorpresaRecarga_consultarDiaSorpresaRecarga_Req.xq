(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIADIASORPRESARECARGA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARDIASORPRESARECARGA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarDiaSorpresaRecarga/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaDiaSorpresaRecarga_consultarDiaSorpresaRecarga_Req/";

declare function xf:consumirAuditoriaDiaSorpresaRecarga_consultarDiaSorpresaRecarga_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
        	<FECHA>{ fn-bea:date-from-string-with-format("yyyy-MM-dd",data(fn:substring($input_Parameters1/EVEFECHARECARGA,1,10))) }</FECHA>
            <HOSTID>{ data($input_Parameters1/EVEHOSTID) }</HOSTID>
            <RECARGA>{ data($input_Parameters1/EVERECARGA) }</RECARGA>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consumirAuditoriaDiaSorpresaRecarga_consultarDiaSorpresaRecarga_Req($input_Parameters1)