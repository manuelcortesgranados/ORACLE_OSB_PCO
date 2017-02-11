(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_ELIMINAR_ELEGIDOILIMITADO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_ELIMINAR_ELEGIDOILIMITADO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/PS_ELIMINAR_ELEGIDOILIMITADO";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_ELIMINAR_ELEGIDO_ILIMITADO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/eliminarElegidoIlimitado_Req/";

declare function xf:eliminarElegidoIlimitado_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_ELEGIDO>{ data($input_Parameters1/ELEGIDO) }</ns0:P_ELEGIDO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:eliminarElegidoIlimitado_Req($input_Parameters1)