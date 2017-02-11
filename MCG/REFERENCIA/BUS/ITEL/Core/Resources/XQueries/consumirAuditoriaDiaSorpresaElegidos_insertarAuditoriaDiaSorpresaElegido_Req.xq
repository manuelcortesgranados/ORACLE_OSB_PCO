(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIADIASORPRESAELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIADIASORPRESAELEGIDO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/InsertarAuditoriaDiaSorpresaElegido";
declare namespace ns1 = "http://www.comcel.com.co/AuditoriaDiaSorpresaElegidosITEL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaDiaSorpresaElegidos_insertarAuditoriaDiaSorpresaElegido_Req/";

declare function xf:consumirAuditoriaDiaSorpresaElegidos_insertarAuditoriaDiaSorpresaElegido_Req($input_Parameters1 as element(ns1:Input_Parameters),
    $evecodresprtc as xs:string,
    $evefechaprc as xs:dateTime)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
            <FECHAPRC>{ $evefechaprc }</FECHAPRC>
            <CODRESP>{ $evecodresprtc }</CODRESP>
            <ELEGIDOS>{ data($input_Parameters1/EVEELEGIDOS/PARAMETRO[1]/MINELEG) }</ELEGIDOS>
            <FAFID>{ data($input_Parameters1/EVEELEGIDOS/PARAMETRO[1]/FAFID) }</FAFID>
            <FECHATRAMA>{ data($input_Parameters1/EVEFECHA) }</FECHATRAMA>
            <METODO>{ data($input_Parameters1/EVEMETODO) }</METODO>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $evecodresprtc as xs:string external;
declare variable $evefechaprc as xs:dateTime external;

xf:consumirAuditoriaDiaSorpresaElegidos_insertarAuditoriaDiaSorpresaElegido_Req($input_Parameters1,
    $evecodresprtc,
    $evefechaprc)
