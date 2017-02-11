(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTARAUDITORIABLOQUEO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../Schemas/BD_ITEL_INSERTAR_AUDITORIA_BLOQUEO.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/ITELSOA/PKG_SOA_ITEL/PRC_INSERTAR_AUDITORIA_BLOQUEO/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarAuditoriaBloqueo";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarAuditoriaBloqueo_Req/";

declare function xf:insertarAuditoriaBloqueo_Req($input_Parameters1 as element(ns0:Input_Parameters))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_MIN>{ data($input_Parameters1/ns0:MIN) }</ns1:P_MIN>
            <ns1:P_TRAMA>{ data($input_Parameters1/ns0:TRAMA) }</ns1:P_TRAMA>
            <ns1:P_BLOQUEOFRAUDE>{ data($input_Parameters1/ns0:BLOQUEOFRAUDE) }</ns1:P_BLOQUEOFRAUDE>
            <ns1:P_BLOQUEOOTRO>{ data($input_Parameters1/ns0:BLOQUEOOTRO) }</ns1:P_BLOQUEOOTRO>
            <ns1:P_TRANSUUID>{ data($input_Parameters1/ns0:TRANSUUID) }</ns1:P_TRANSUUID>
        </ns1:InputParameters>
};

declare variable $input_Parameters1 as element(ns0:Input_Parameters) external;

xf:insertarAuditoriaBloqueo_Req($input_Parameters1)