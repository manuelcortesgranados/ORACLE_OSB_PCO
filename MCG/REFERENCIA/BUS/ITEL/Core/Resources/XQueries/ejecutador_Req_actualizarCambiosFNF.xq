(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZAR_CAMBIOS_FNF.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/actualizarCambiosFNF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_actualizarCambiosFNF/";

declare function xf:ejecutador_Req_actualizarCambiosFNF($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <MES>{ month-from-dateTime(current-dateTime())}</MES>
            <ANIO>{ year-from-dateTime(current-dateTime())}</ANIO>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutador_Req_actualizarCambiosFNF($min)
