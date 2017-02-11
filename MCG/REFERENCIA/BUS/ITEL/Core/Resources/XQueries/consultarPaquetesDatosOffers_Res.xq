(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPAQUETESDATOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesDatos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarPaquetesDatosOffers_Res/";

declare function xf:consultarPaquetesDatosOffers_Res($string1 as xs:string,
    $string2 as xs:string,
    $string3 as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CODIGO>{ $string1 }</CODIGO>
            <TIPO>{ $string2 }</TIPO>
            <CANAL>{ $string3 }</CANAL>
        </ns0:Input_Parameters>
};

declare variable $string1 as xs:string external;
declare variable $string2 as xs:string external;
declare variable $string3 as xs:string external;

xf:consultarPaquetesDatosOffers_Res($string1,
    $string2,
    $string3)
