(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_PAQUETESRECURRENTES.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_PAQUETESRECURRENTES.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_paquetesRecurrentes";
declare namespace ns0 = "http://www.comcel.com.co/PaquetesRecurrentes/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/paquetesRecurrente_Req/";

declare function xf:paquetesRecurrente_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:ACCION_IN>{ data($input_Parameters1/ACCION_IN) }</ns1:ACCION_IN>
            <ns1:MIN_IN>{ data($input_Parameters1/MIN_IN) }</ns1:MIN_IN>
            <ns1:DCORTE_IN>{ data($input_Parameters1/DCORTE_IN) }</ns1:DCORTE_IN>
            <ns1:SERVICIO_IN>{ data($input_Parameters1/SERVICIO_IN) }</ns1:SERVICIO_IN>
            <ns1:NO_VALIDA_IN>{ data($input_Parameters1/NO_VALIDA_IN) }</ns1:NO_VALIDA_IN>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:paquetesRecurrente_Req($input_Parameters1)