(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_REPROCESORECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_REPROCESORECARGADATOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarReprocesoRecargaDatos";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/bd_insertarReprocesoRecargaDatos";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarReprocesoRecargaDatos_Req/";

declare function xf:insertarReprocesoRecargaDatos_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_BONO>{ data($input_Parameters1/BONO) }</ns0:P_BONO>
            <ns0:P_RECARGA>{ data($input_Parameters1/RECARGA) }</ns0:P_RECARGA>
            <ns0:P_CONSECUTIVO>{ data($input_Parameters1/CONSECUTIVO) }</ns0:P_CONSECUTIVO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarReprocesoRecargaDatos_Req($input_Parameters1)