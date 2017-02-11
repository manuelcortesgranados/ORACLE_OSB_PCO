(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGARAR.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERT_RTC_REQUESTERROR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/Insertrtcrequesterror";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaRAR_insertarReprocesoRecargaRAR_Req/";

declare function xf:consumirAuditoriaRecargaRAR_insertarReprocesoRecargaRAR_Req($input_Parameters1 as element(ns1:Input_Parameters),
    $rtcresp as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
            <FECHA>{ fn:current-dateTime() }</FECHA>
            <RTCRESP>{ data($rtcresp) }</RTCRESP>
            <ESTADO>0</ESTADO>
            <REINTENTOS>0</REINTENTOS>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $rtcresp as xs:string external;

xf:consumirAuditoriaRecargaRAR_insertarReprocesoRecargaRAR_Req($input_Parameters1,
    $rtcresp)