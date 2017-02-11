(:: pragma bea:global-element-parameter parameter="$input_Parameters1" element="ns1:Input_Parameters" location="../Schemas/MS_ITEL_AUDITORIAPROMOPAQUETESTAT.xsd" ::)
(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/AuditoriaITEL/";
declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consumirAuditoriaPromoPaqTAT_ejecutarTrama2/";

declare function xf:consumirAuditoriaPromoPaqTAT_ejecutarTrama($input_Parameters1 as element(ns1:Input_Parameters),
    $usuarioPromo as xs:string, $comentarioPromo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ concat($usuarioPromo , "!414!" , $input_Parameters1/EVEMIN , "!" , $comentarioPromo , ";" , $input_Parameters1/EVEHOSTID , ";" , $input_Parameters1/EVECONSECUTIVO , ";" , $input_Parameters1/EVECODIGOPAQUETE , ";0!*") }</TRAMA>
        </ns0:Input_Parameters>
};

declare variable $input_Parameters1 as element(ns1:Input_Parameters) external;
declare variable $usuarioPromo as xs:string external;
declare variable $comentarioPromo as xs:string external;

xf:consumirAuditoriaPromoPaqTAT_ejecutarTrama($input_Parameters1,
    $usuarioPromo, $comentarioPromo)
