(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_CAMBIOS_FNF.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarCambiosFNF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_consultarCambiosFNF/";

declare function xf:ejecutarReglasNegocio_Req_consultarCambiosFNF($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <MES>{ month-from-dateTime(current-dateTime())}</MES>
            <ANIO>{ year-from-dateTime(current-dateTime())}</ANIO>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutarReglasNegocio_Req_consultarCambiosFNF($min)
