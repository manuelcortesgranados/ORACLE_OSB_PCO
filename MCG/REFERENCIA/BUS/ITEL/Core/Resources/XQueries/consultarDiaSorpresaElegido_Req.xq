(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARDIASORPRESAELEGIDO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARDIASORPRESAELEGIDO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarDiaSorpresaElegido/";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarDiaSorpresaElegido";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarDiaSorpresaElegido_Req/";

declare function xf:consultarDiaSorpresaElegido_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_FECHA>{ data($input_Parameters1/FECHA) }</ns1:P_FECHA>
            <ns1:P_TIPO>{ data($input_Parameters1/TIPO) }</ns1:P_TIPO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarDiaSorpresaElegido_Req($input_Parameters1)
