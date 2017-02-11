(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/auditoriaITELOCSDRP_Req_ejecutador/";

declare function xf:auditoriaITELOCSDRP_Req_ejecutador($trama as xs:string,
    $ip as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ $trama }</TRAMA>
            <IP_ORIGEN>{ $ip }</IP_ORIGEN>
        </ns0:Input_Parameters>
};

declare variable $trama as xs:string external;
declare variable $ip as xs:string external;

xf:auditoriaITELOCSDRP_Req_ejecutador($trama,
    $ip)
