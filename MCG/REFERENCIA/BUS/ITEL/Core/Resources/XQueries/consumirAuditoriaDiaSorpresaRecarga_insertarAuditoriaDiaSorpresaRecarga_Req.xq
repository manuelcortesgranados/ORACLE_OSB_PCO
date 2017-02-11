(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIADIASORPRESARECARGA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIADIASORPRESARECARGA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarAuditoriaDiaSorpresaRecarga";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaDiaSorpresaRecarga_insertarAuditoriaDiaSorpresaRecarga_Req/";

declare function xf:consumirAuditoriaDiaSorpresaRecarga_insertarAuditoriaDiaSorpresaRecarga_Req($input_Parameters1 as element(ns1:Input_Parameters),
    $evecodresprtc as xs:string,
    $evefechaprc as xs:dateTime)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
            <FECHAPRC>{ $evefechaprc }</FECHAPRC>
            <CODRESPRTC>{ $evecodresprtc }</CODRESPRTC>
            <RECARGA>{ data($input_Parameters1/EVERECARGA) }</RECARGA>
            <CONSECUTIVO>{ data($input_Parameters1/EVECONSECUTIVO) }</CONSECUTIVO>
            <HOSTID>{ data($input_Parameters1/EVEHOSTID) }</HOSTID>
            <FECHARECARGA>{ data($input_Parameters1/EVEFECHARECARGA) }</FECHARECARGA>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $evecodresprtc as xs:string external;
declare variable $evefechaprc as xs:dateTime external;

xf:consumirAuditoriaDiaSorpresaRecarga_insertarAuditoriaDiaSorpresaRecarga_Req($input_Parameters1,
    $evecodresprtc,
    $evefechaprc)