(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARRECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTARRECARGADATOS.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarRecargaDatos";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarRecargaDatos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarRecargaDatos_Req/";

declare function xf:consultarRecargaDatos_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_HOSTID>{ data($input_Parameters1/HOSTID) }</ns1:P_HOSTID>
            <ns1:P_RECARGA>{ data($input_Parameters1/RECARGA) }</ns1:P_RECARGA>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarRecargaDatos_Req($input_Parameters1)