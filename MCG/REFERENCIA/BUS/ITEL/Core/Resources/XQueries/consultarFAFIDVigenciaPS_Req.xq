(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARFAFIDVIGENCIA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarFAFIDVigencia";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarFAFIDVigenciaPS_Req/";

declare function xf:consultarFAFIDVigenciaPS_Req($serviceClass as xs:decimal,
    $tipo as xs:string,
    $vigencia as xs:string,
    $fafIdGroup as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <SERVICECLASS>{ $serviceClass }</SERVICECLASS>
            <TIPO>{ $tipo }</TIPO>
            <VIGENCIA>{ $vigencia }</VIGENCIA>
            <FAFIDGROUP>{ $fafIdGroup }</FAFIDGROUP>
        </ns0:Input_Parameters>
};

declare variable $serviceClass as xs:decimal external;
declare variable $tipo as xs:string external;
declare variable $vigencia as xs:string external;
declare variable $fafIdGroup as xs:string external;

xf:consultarFAFIDVigenciaPS_Req($serviceClass,
    $tipo,
    $vigencia,
    $fafIdGroup)