(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRECARGAESCALERA.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARRECARGAESCALERA.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarRecargaEscalera";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRecargaEscalera/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRecargaEscalera_Req/";

declare function xf:consultarRecargaEscalera_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_HOSTIDIN>{ data($input_Parameters1/HOSTIDIN) }</ns1:P_HOSTIDIN>
            <ns1:P_RECARGA>{ data($input_Parameters1/RECARGA) }</ns1:P_RECARGA>
            <ns1:P_MIN>{ data($input_Parameters1/MIN) }</ns1:P_MIN>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarRecargaEscalera_Req($input_Parameters1)