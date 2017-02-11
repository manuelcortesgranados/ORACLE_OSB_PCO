(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns2:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOCINE.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARCONDICIONESPROMO.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_AUDITORIAPROMOCINE.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns1 = "http://www.comcel.com.co/insertarAuditoriaPromoCine";
declare namespace ns0 = "http://www.comcel.com.co/consultarCondicionesPromo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaPromo_insertarAuditoriaPromoCine_Req/";

declare function xf:consumirAuditoriaPromo_insertarAuditoriaPromoCine_Req($input_Parameters1 as element(ns2:Input_Parameters),
    $wS_Result1 as element(ns0:WS_Result),
     $evecodresprtc as xs:string,
     $pin as xs:string,
     $notificacion as xs:string,
     $evefechaprc as xs:dateTime )
    as element(ns1:Input_Parameters) {
        <ns1:Input_Parameters>
            <MSISDN>{ data($input_Parameters1/EVEMIN) }</MSISDN>
            <PIN>{ $pin }</PIN>
            <CODIGO_NOTICACION>{ $evecodresprtc }</CODIGO_NOTICACION>
            <DESCRIPCION_NOTIFICACION>{ $notificacion   }</DESCRIPCION_NOTIFICACION>
            <FECHA_ASIGNACION>{ $evefechaprc }</FECHA_ASIGNACION>
            <FECHA_RECARGA>{ data($input_Parameters1/EVEFECHARECARGA) }</FECHA_RECARGA>
            <VALOR_RECARGA>{ data($input_Parameters1/EVERECARGA) }</VALOR_RECARGA>
            <CONSECUTIVO>{ data($input_Parameters1/EVECONSECUTIVO) }</CONSECUTIVO>
            <HOSTID>{ data($input_Parameters1/EVEHOSTID) }</HOSTID>
        </ns1:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns2:Input_Parameters) external;
declare variable $wS_Result1 as element(ns0:WS_Result) external;
declare variable $evecodresprtc as xs:string external;
declare variable $pin as xs:string external;
declare variable $notificacion as xs:string external;
declare variable $evefechaprc as xs:dateTime external;

xf:consumirAuditoriaPromo_insertarAuditoriaPromoCine_Req($input_Parameters1,
    $wS_Result1,$evecodresprtc,$pin,$notificacion,$evefechaprc)