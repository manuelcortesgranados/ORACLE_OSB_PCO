(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIADIASORPRESAELEGIDO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTARAUDITORIADIASORPRESAELEGIDO.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_insertarAuditoriaDiaSorpresaElegido";
declare namespace ns1 = "http://www.comcel.com.co/InsertarAuditoriaDiaSorpresaElegido";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarAuditoriaDiaSorpresaElegido_Req/";

declare function xf:insertarAuditoriaDiaSorpresaElegido_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_FECHAPRC>{ data($input_Parameters1/FECHAPRC) }</ns0:P_FECHAPRC>
            <ns0:P_CODRESP>{ data($input_Parameters1/CODRESP) }</ns0:P_CODRESP>
            <ns0:P_ELEGIDOS>{ data($input_Parameters1/ELEGIDOS) }</ns0:P_ELEGIDOS>
            <ns0:P_FAFID>{ data($input_Parameters1/FAFID) }</ns0:P_FAFID>
            <ns0:P_FECHATRAMA>{ data($input_Parameters1/FECHATRAMA) }</ns0:P_FECHATRAMA>
            <ns0:P_METODO>{ data($input_Parameters1/METODO) }</ns0:P_METODO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarAuditoriaDiaSorpresaElegido_Req($input_Parameters1)
