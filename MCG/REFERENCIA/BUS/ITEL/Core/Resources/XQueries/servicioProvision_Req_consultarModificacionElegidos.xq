(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTAR_MODIFICACION_ELEGIDOS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/consultarModificacionElegidos/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_consultarModificacionElegidos/";

declare function xf:servicioProvision_Req_consultarModificacionElegidos($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <MES>{ month-from-dateTime(current-dateTime())}</MES>
            <ANIO>{ year-from-dateTime(current-dateTime())}</ANIO>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:servicioProvision_Req_consultarModificacionElegidos($min)