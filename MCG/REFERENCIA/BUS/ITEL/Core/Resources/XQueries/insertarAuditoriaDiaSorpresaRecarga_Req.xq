(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIADIASORPRESARECARGA.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIADIASORPRESARECARGA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarAuditoriaDiaSorpresaRecarga";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_insertarAuditoriaDiaSorpresaRecarga";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarAuditoriaDiaSorpresaRecarga_Req/";

declare function xf:insertarAuditoriaDiaSorpresaRecarga_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_FECHAPRC>{ data($input_Parameters1/FECHAPRC) }</ns0:P_FECHAPRC>
            <ns0:P_CODRESPRTC>{ data($input_Parameters1/CODRESPRTC) }</ns0:P_CODRESPRTC>
            <ns0:P_RECARGA>{ data($input_Parameters1/RECARGA) }</ns0:P_RECARGA>
            <ns0:P_CONSECUTIVO>{ data($input_Parameters1/CONSECUTIVO) }</ns0:P_CONSECUTIVO>
            <ns0:P_HOSTID>{ data($input_Parameters1/HOSTID) }</ns0:P_HOSTID>
            <ns0:P_FECHARECARGA>{ data($input_Parameters1/FECHARECARGA) }</ns0:P_FECHARECARGA>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarAuditoriaDiaSorpresaRecarga_Req($input_Parameters1)