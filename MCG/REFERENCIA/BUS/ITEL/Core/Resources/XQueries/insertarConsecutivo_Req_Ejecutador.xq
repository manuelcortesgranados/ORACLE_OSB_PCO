(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_CONSECUTIVO.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/insertarConsecutivo/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarConsecutivo_Req_Ejecutador/";

declare function xf:insertarConsecutivo_Req_Ejecutador($consecutivo as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <CONSECUTIVO>{ $consecutivo }</CONSECUTIVO>
        </ns0:Input_Parameters>
};

declare variable $consecutivo as xs:string external;

xf:insertarConsecutivo_Req_Ejecutador($consecutivo)