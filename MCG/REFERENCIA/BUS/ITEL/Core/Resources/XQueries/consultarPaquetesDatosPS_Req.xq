(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARPAQUETESDATOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarPaquetesDatos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ConsultarPaquetesDatosPS_Req/";

declare function xf:ConsultarPaquetesDatosPS_Req($codigo as xs:string, $canal as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CODIGO>{ $codigo }</CODIGO>
            <TIPO>{ data("1") }</TIPO> (:1 ID_SM 2 OFFER_ID :)
            <CANAL>{ $canal }</CANAL> (:1 consulta id_sm :)
        </ns0:Input_Parameters>
};

declare variable $codigo as xs:string external;
declare variable $canal as xs:string external;

xf:ConsultarPaquetesDatosPS_Req($codigo, $canal)