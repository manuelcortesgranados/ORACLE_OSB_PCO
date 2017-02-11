(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZARCANTIDADCONSULTASDIA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ActualizarCantidadConsultasDia/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_actualizarConsultasRealizadas/";

declare function xf:ejecutador_Req_actualizarConsultasRealizadas($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutador_Req_actualizarConsultasRealizadas($min)