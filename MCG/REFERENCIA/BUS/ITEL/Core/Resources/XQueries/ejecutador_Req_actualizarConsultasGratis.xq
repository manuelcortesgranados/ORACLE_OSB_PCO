(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ACTUALIZARCANTIDADCONSULTASGRATISDIA.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/ActualizarCantidadConsultasGratisDia/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_actualizarConsultasGratis/";

declare function xf:ejecutador_Req_actualizarConsultasGratis($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutador_Req_actualizarConsultasGratis($min)