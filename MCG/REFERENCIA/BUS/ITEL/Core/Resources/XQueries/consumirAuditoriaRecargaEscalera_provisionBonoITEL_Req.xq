(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_EJECUTARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EjecutarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarTramaSocketTransport_Req_ejecutarTramaLocal/";

declare function xf:consumirAuditoriaRecargaEscalera_provisionBonoITEL_Req($min as xs:string, $comentario as xs:string, $hostid as xs:string, $cuenta as xs:string,
	$valor as xs:string, $vigencia as xs:string, $consecutivo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ concat("ITEL!Itel_2016+!406!",$min,"!",$comentario,";",$hostid,";",$consecutivo,";",$cuenta,";",$valor,";",$vigencia,"!*") }</TRAMA>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;
declare variable $comentario as xs:string external;
declare variable $hostid as xs:string external;
declare variable $cuenta as xs:string external;
declare variable $valor as xs:string external;
declare variable $vigencia as xs:string external;
declare variable $consecutivo as xs:string external;

xf:consumirAuditoriaRecargaEscalera_provisionBonoITEL_Req($min, $comentario, $hostid, $cuenta, $valor, $vigencia, $consecutivo)