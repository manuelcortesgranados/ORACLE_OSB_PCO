(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../Schemas/BD_ITEL_RANGOTELMEX.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARANGOTELMEX.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/ConsultarRangoTelmex/";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/SYSADM/SP_RANGO_TELMEX/";
declare namespace xf = "http://tempuri.org/ITEL/BSCS/Resources/XQueries/consultarRangoTelmex_Res/";


declare function trim( $arg as xs:string? )  as xs:string {       
   replace(replace($arg,'\s+$',''),'^\s+','')
 };

declare function xf:consultarRangoTelmex_Res($outputParameters1 as element(ns0:OutputParameters),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>{$codigo}</CODIGO>
            <MENSAJE>
                <EXISTE>{ trim(fn:normalize-space(data($outputParameters1/ns0:EXISTE))) }</EXISTE>
                <DESC_ERROR>{ data($outputParameters1/ns0:DESC_ERROR) }</DESC_ERROR>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};


declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;
declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:consultarRangoTelmex_Res($outputParameters1,
    $codigo,
    $descripcion)