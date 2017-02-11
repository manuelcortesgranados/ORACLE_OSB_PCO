(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_ELEGIDO_ILIMITADO_FIJO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_ELEGIDO_ILIM_FIJO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_ELEGIDO_ILIM_FIJO/";
declare namespace ns0 = "http://www.comcel.com.co/PS_INSERTAR_ELEGIDO_ILIMITADO_FIJO";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarElegidoFijo_Req/";

declare function xf:insertarElegidoFijo_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($input_Parameters1/MIN) }</ns1:P_MIN>
            <ns1:P_BESTFNF>{ data($input_Parameters1/BESTFNF) }</ns1:P_BESTFNF>
            <ns1:P_OLDBESTFNF>{ data($input_Parameters1/OLDBESTFNF) }</ns1:P_OLDBESTFNF>
            <ns1:P_FECHACREACION>{ data($input_Parameters1/FECHACREACION) }</ns1:P_FECHACREACION>
            <ns1:P_VIGENCIA>{ data($input_Parameters1/VIGENCIA) }</ns1:P_VIGENCIA>
            <ns1:P_PROCESO>{ data($input_Parameters1/PROCESO) }</ns1:P_PROCESO>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:insertarElegidoFijo_Req($input_Parameters1)