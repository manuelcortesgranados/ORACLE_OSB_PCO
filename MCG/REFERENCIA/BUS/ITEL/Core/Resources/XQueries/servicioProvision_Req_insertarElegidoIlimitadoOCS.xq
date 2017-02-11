(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_ELEGIDO_ILIMITADOOCS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/InsertarElegidoOCS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/servicioProvision_Req_insertarElegidoIlimitadoOCS/";

declare function xf:servicioProvision_Req_insertarElegidoIlimitadoOCS($min as xs:decimal,
    $elegido as xs:string,
    $elegidoAntiguo as xs:string,
    $fechaCreacion as xs:string,
    $fechaExpiracion as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <ELEGIDO>{ $elegido }</ELEGIDO>
            <ELEGIDOANTIGUO>{ $elegidoAntiguo }</ELEGIDOANTIGUO>
            <FECHACREACION>{ $fechaCreacion }</FECHACREACION>
            <FECHAEXPIRACION>{ $fechaExpiracion }</FECHAEXPIRACION>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;
declare variable $elegido as xs:string external;
declare variable $elegidoAntiguo as xs:string external;
declare variable $fechaCreacion as xs:string external;
declare variable $fechaExpiracion as xs:string external;

xf:servicioProvision_Req_insertarElegidoIlimitadoOCS($min,
    $elegido,
    $elegidoAntiguo,
    $fechaCreacion,
    $fechaExpiracion)