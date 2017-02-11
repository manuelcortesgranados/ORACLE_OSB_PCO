(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_RANGORECARGA_OCS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarRangoRecargaOCS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validar_Req_consultarRangoRecargaOCS/";

declare function xf:validar_Req_consultarRangoRecargaOCS($valor as xs:string,
    $bono as xs:string,
    $regla as xs:string,
    $sc as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <VALOR>{ $valor }</VALOR>
            <BONO>{ $bono }</BONO>
            <REGLA>{ $regla }</REGLA>
            <SC>{ $sc }</SC>
        </ns0:Input_Parameters>
};

declare variable $valor as xs:string external;
declare variable $bono as xs:string external;
declare variable $regla as xs:string external;
declare variable $sc as xs:string external;

xf:validar_Req_consultarRangoRecargaOCS($valor,
    $bono,
    $regla,
    $sc)