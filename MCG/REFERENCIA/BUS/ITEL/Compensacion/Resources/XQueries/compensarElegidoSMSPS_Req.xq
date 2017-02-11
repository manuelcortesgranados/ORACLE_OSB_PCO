(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_COMPENSAR_ELEGIDOSMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/CompensarElegidoSMS/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/compensarElegidoSMSPS_Req/";

declare function xf:compensarElegidoSMSPS_Req($min as xs:decimal,
    $elegido as xs:string,
    $elegidoAntiguo as xs:string,
    $fechaCreacion as xs:string,
    $fechaExpiracion as xs:string,
    $vigencia as xs:string,
    $suscripcion as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <ELEGIDO>{ $elegido }</ELEGIDO>
            <ELEGIDOANTIGUO>{ $elegidoAntiguo }</ELEGIDOANTIGUO>
            <FECHACREACION>{ fn:substring($fechaCreacion,1, 10) }</FECHACREACION>
            <FECHAEXPIRACION>{ fn:substring($fechaExpiracion,1, 10) }</FECHAEXPIRACION>
            <VIGENCIA>{ $vigencia }</VIGENCIA>
            <SUSCRIPCION>{ $suscripcion }</SUSCRIPCION>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;
declare variable $elegido as xs:string external;
declare variable $elegidoAntiguo as xs:string external;
declare variable $fechaCreacion as xs:string external;
declare variable $fechaExpiracion as xs:string external;
declare variable $vigencia as xs:string external;
declare variable $suscripcion as xs:string external;

xf:compensarElegidoSMSPS_Req($min,
    $elegido,
    $elegidoAntiguo,
    $fechaCreacion,
    $fechaExpiracion,
    $vigencia,
    $suscripcion)