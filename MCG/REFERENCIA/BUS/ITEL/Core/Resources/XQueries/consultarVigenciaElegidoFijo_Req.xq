(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARVIGENCIAELEGIDO_FIJO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_CONSULTAR_VIG_ELEGIDO_FIJO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_CONSULTAR_VIG_ELEGIDO_FIJO/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarVigenciaElegidoFijo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarVigenciaElegidoFijo_Req/";

declare function xf:consultarVigenciaElegidoFijo_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($input_Parameters1/MIN) }</ns1:P_MIN>
            <ns1:P_MIN_ELEGIDO>{ data($input_Parameters1/MIN_ELEGIDO) }</ns1:P_MIN_ELEGIDO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:consultarVigenciaElegidoFijo_Req($input_Parameters1)