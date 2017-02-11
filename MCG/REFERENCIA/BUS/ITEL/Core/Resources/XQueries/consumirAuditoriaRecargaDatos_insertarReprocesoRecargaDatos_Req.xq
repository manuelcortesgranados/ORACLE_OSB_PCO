(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIARECARGADATOS.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_REPROCESORECARGADATOS.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/InsertarReprocesoRecargaDatos";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaRecargaDatos_insertarReprocesoRecargaDatos_Req/";

declare function xf:consumirAuditoriaRecargaDatos_insertarReprocesoRecargaDatos_Req($input_Parameters1 as element(ns1:Input_Parameters),
    $evebono as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ data($input_Parameters1/EVEMIN) }</MIN>
            <BONO>{ data($evebono) }</BONO>
            <RECARGA>{ data($input_Parameters1/EVERECARGA) }</RECARGA>
            <CONSECUTIVO>{ data($input_Parameters1/EVECONSECUTIVO) }</CONSECUTIVO>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $evebono as xs:string external;

xf:consumirAuditoriaRecargaDatos_insertarReprocesoRecargaDatos_Req($input_Parameters1,
    $evebono)