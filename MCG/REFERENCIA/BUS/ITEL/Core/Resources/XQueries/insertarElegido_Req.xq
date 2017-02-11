(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_ELEGIDO_ILIMITADO.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_ELEGIDO_ILIMITADO.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/PS_INSERTAR_ELEGIDO_ILIMITADO";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_ELEGIDO_ILIMITADO/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarElegido_Req/";

declare function xf:insertarElegido_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/MIN) }</ns0:P_MIN>
            <ns0:P_BESTFNF>{ data($input_Parameters1/BESTFNF) }</ns0:P_BESTFNF>
            <ns0:P_OLDBESTFNF>{ data($input_Parameters1/OLDBESTFNF) }</ns0:P_OLDBESTFNF>
            <ns0:P_FECHACREACION>{ data($input_Parameters1/FECHACREACION) }</ns0:P_FECHACREACION>
            <ns0:P_VIGENCIA>{ data($input_Parameters1/VIGENCIA) }</ns0:P_VIGENCIA>
            <ns0:P_PROCESO>{ data($input_Parameters1/PROCESO) }</ns0:P_PROCESO>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarElegido_Req($input_Parameters1)