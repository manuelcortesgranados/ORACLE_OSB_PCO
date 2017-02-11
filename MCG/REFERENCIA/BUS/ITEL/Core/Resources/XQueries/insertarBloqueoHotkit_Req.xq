(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_BLOQUEO_HOTKIT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_BLOQUEO_HOTKIT.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/InsertarBloqueoHotkit";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_BLOQUEO_HOTKIT/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarBloqueoHotkit_Req/";

declare function xf:insertarBloqueoHotkit_Req($input_Parameters1 as element(ns1:Input_Parameters))
    as element(ns0:InputParameters) {
        <ns0:InputParameters>
            <ns0:P_MIN>{ data($input_Parameters1/ns1:MIN) }</ns0:P_MIN>
            <ns0:P_TRAMA>{ data($input_Parameters1/ns1:TRAMA) }</ns0:P_TRAMA>
            <ns0:P_NUMREPORTE>{ data($input_Parameters1/ns1:NUMEROREPORTE) }</ns0:P_NUMREPORTE>
            <ns0:P_TRANSUUID>{ data($input_Parameters1/ns1:TRANSUUID) }</ns0:P_TRANSUUID>
        </ns0:InputParameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;

xf:insertarBloqueoHotkit_Req($input_Parameters1)