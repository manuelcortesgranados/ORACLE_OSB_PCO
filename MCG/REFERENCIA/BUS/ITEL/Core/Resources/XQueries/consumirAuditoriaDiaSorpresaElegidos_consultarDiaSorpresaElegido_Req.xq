(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIADIASORPRESAELEGIDOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARDIASORPRESAELEGIDO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarDiaSorpresaElegido/";
declare namespace ns1 = "http://www.comcel.com.co/AuditoriaDiaSorpresaElegidosITEL/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaDiaSorpresaElegido_consultarDiaSorpresaElegido_Req/";

declare function xf:consumirAuditoriaDiaSorpresaElegido_consultarDiaSorpresaElegido_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <FECHA>{ fn-bea:date-from-string-with-format("yyyy-MM-dd",data(fn:substring($input_Parameters1/EVEFECHA,1,10))) }</FECHA>
            <TIPO>{ data($input_Parameters1/EVEELEGIDOS/PARAMETRO[1]/FAFID) }</TIPO>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consumirAuditoriaDiaSorpresaElegido_consultarDiaSorpresaElegido_Req($input_Parameters1)
