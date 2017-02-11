(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_VALIDARTRAMA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ValidarTrama/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/validarTrama_Req/";

declare function xf:validarTrama_Req($trama as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <TRAMA>{ fn:normalize-space($trama) }</TRAMA>
        </ns0:Input_Parameters>
};

declare variable $trama as xs:string external;

xf:validarTrama_Req($trama)