(:: pragma bea:global-element-parameter parameter="$tramaSalida" element="ns0:WS_Result" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTramaSocketTransport_Res/";

declare function xf:ejecutarTramaSocketTransport_Res($tramaSalida as element(ns0:WS_Result))
    as xs:string {
        data($tramaSalida/MENSAJE)
};

declare variable $tramaSalida as element(ns0:WS_Result) external;

xf:ejecutarTramaSocketTransport_Res($tramaSalida)