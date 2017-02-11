(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTramaSocketTransport_Req_ejecutarTramaLocal/";

declare function xf:ejecutarTramaSocketTransport_Req_ejecutarTramaLocal($trama as xs:string,
	$ipOrigen as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ $trama }</TRAMA>
            <IP_ORIGEN>{ $ipOrigen }</IP_ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $trama as xs:string external;
declare variable $ipOrigen as xs:string external;

xf:ejecutarTramaSocketTransport_Req_ejecutarTramaLocal($trama, $ipOrigen)