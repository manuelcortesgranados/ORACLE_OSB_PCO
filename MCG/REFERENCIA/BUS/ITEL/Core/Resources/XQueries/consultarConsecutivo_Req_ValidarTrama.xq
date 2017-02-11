(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_CONSECUTIVO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarConsecutivo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarConsecutivo_Req_ValidarTrama/";

declare function xf:consultarConsecutivo_Req_ValidarTrama($consecutivo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CONSECUTIVO>{ $consecutivo }</CONSECUTIVO>
        </ns0:Input_Parameters>
};

declare variable $consecutivo as xs:string external;

xf:consultarConsecutivo_Req_ValidarTrama($consecutivo)