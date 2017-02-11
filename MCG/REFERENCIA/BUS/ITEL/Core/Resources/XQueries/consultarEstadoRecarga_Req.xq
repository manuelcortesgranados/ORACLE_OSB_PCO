(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARESTADORECARGA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarEstadoRecarga/";
declare namespace xf = "http://tempuri.org/ITEL/Trama500/Resources/XQueries/consultarEstadoRecarga_Req/";

declare function xf:consultarEstadoRecarga_Req($min as xs:string,
    $hostId as xs:string,
    $consecutivo as xs:string,
    $fechaRecarga as xs:date)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <HOST_ID>{ $hostId }</HOST_ID>
            <CONSECUTIVO>{ $consecutivo }</CONSECUTIVO>
            <FECHA_RECARGA>{ $fechaRecarga }</FECHA_RECARGA>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $hostId as xs:string external;
declare variable $consecutivo as xs:string external;
declare variable $fechaRecarga as xs:date external;

xf:consultarEstadoRecarga_Req($min,
    $hostId,
    $consecutivo,
    $fechaRecarga)