(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_CREAR_TICKLER.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_CREAR_TICKLER.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_crearTickler";
declare namespace ns0 = "http://www.claro.com.co/Elegidos/crearTickler/";
declare namespace xf = "http://tempuri.org/Elegidos/CICLOP/Resources/XQueries/crearTickler_Req/";

declare function xf:crearTickler_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MSISDN>{ data($input_Parameters1/MSISDN) }</ns1:P_MSISDN>
            <ns1:P_CODIGO>{ data($input_Parameters1/CODIGO) }</ns1:P_CODIGO>
            <ns1:P_DESC_CORTA>{ data($input_Parameters1/DESC_CORTA) }</ns1:P_DESC_CORTA>
            <ns1:P_DESC_LARGA>{ data($input_Parameters1/DESC_LARGA) }</ns1:P_DESC_LARGA>            
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:crearTickler_Req($input_Parameters1)
