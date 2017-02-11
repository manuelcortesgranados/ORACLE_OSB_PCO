(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ELIMINAR_CAMBIOS_FNF.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/eliminarCambiosFNF/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/ejecutador_Req_eliminarCambiosFNF/";

declare function xf:ejecutador_Req_eliminarCambiosFNF($min as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
        </ns0:Input_Parameters>
};

declare variable $min as xs:string external;

xf:ejecutador_Req_eliminarCambiosFNF($min)
