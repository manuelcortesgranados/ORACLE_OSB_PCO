(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCONDICIONESPROMO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_CONSULTARCONDICIONESPROMO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/consultarCondicionesPromo/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_consultarCondicionesPromo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarCondicionesPromo_Req/";

declare function xf:consultarCondicionesPromo_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:IN_MSISDN>{ data($input_Parameters1/MSISDN) }</ns0:IN_MSISDN>
            <ns0:IN_VALOR_RECARGA>{ data($input_Parameters1/VALOR_RECARGA) }</ns0:IN_VALOR_RECARGA>
            <ns0:IN_HOSTID>{ data($input_Parameters1/HOSTID) }</ns0:IN_HOSTID>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:consultarCondicionesPromo_Req($input_Parameters1)