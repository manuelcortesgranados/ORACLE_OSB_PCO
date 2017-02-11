(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_CAMBIOS_FNF.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ACTUALIZAR_CAMBIOS_FNF.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/actualizarCambiosFNF";
declare namespace ns0 = "http://www.comcel.com.co/actualizarCambiosFNF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/actualizarCambiosFNF_Req/";

declare function xf:actualizarCambiosFNF_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
        	<ns1:P_MIN>{ data($input_Parameters1/MIN) }</ns1:P_MIN>
            <ns1:P_MES>{ data($input_Parameters1/MES) }</ns1:P_MES>
            <ns1:P_ANIO>{ data($input_Parameters1/ANIO) }</ns1:P_ANIO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:actualizarCambiosFNF_Req($input_Parameters1)