(:: pragma bea:global-element-return element="ns0:Input_Parameters" location="../Schemas/PS_ITEL_INSERTAR_ELEGIDOSMS.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/InsertarElegidoSMS";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/insertarElegidoSMSPS_Res/";

declare function xf:insertarElegidoSMSPS_Res($min as xs:decimal,
    $elegido as xs:string,
    $elegidoAntiguo as xs:string,
    $fechaCreacion as xs:string,
    $vigencia as xs:string,
    $suscripcion as xs:string)
    as element(ns0:Input_Parameters) {
        <ns0:Input_Parameters>
            <MIN>{ $min }</MIN>
            <ELEGIDO>{ $elegido }</ELEGIDO>
            <ELEGIDOANTIGUO>{ $elegidoAntiguo }</ELEGIDOANTIGUO>
            <FECHACREACION>{ $fechaCreacion }</FECHACREACION>
            <VIGENCIA>{ $vigencia }</VIGENCIA>
            <SUSCRIPCION>{ $suscripcion }</SUSCRIPCION>
        </ns0:Input_Parameters>
};

declare variable $min as xs:decimal external;
declare variable $elegido as xs:string external;
declare variable $elegidoAntiguo as xs:string external;
declare variable $fechaCreacion as xs:string external;
declare variable $vigencia as xs:string external;
declare variable $suscripcion as xs:string external;


xf:insertarElegidoSMSPS_Res($min,
    $elegido,
    $elegidoAntiguo,
    $fechaCreacion,
    $vigencia,
    $suscripcion)