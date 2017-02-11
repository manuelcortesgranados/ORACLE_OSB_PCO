(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_ELIMINAR_ELEGIDOSMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/EliminarElegidoSMS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/eliminarElegidoSMSPS_Req/";

declare function xf:eliminarElegidoSMSPS_Req($min as xs:decimal,
    $elegido as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <ELEGIDO>{ $elegido }</ELEGIDO>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;
declare variable $elegido as xs:string external;

xf:eliminarElegidoSMSPS_Req($min,
    $elegido)