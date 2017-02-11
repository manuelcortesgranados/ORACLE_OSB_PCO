(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_CONSULTARCANTIDADCONSULTASDIA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ConsultarCantidadConsultasDia/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutarReglasNegocio_Req_consultarCantidadConsultas/";

declare function xf:ejecutarReglasNegocio_Req_consultarCantidadConsultas($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutarReglasNegocio_Req_consultarCantidadConsultas($min)