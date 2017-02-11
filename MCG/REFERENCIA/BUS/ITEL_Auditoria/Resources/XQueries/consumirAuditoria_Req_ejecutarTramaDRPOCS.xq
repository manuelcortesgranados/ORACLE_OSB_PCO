(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../../../ITEL/Core/Resources/Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL_Auditoria/Resources/XQueries/consumirAuditoria_Req_ejecutarTramaDRPOCS/";

declare function xf:consumirAuditoria_Req_ejecutarTramaDRPOCS($trama as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ $trama }</TRAMA>
            <IP_ORIGEN>{ "" }</IP_ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $trama as xs:string external;

xf:consumirAuditoria_Req_ejecutarTramaDRPOCS($trama)