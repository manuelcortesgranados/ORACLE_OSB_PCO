(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR.xsd" ::)

declare namespace ns0 = "http://www.comcel.com.co/CrearSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorOCS_Res/";

declare function xf:crearSuscriptorOCS_Res($exito as xs:string, $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{$codigo}</CODIGO>
            <MENSAJE>
                <CREAR_SUSCRIPTOR exito = "{ data($exito) }"
                                  mensaje = "{ data($descripcion) }"/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $exito as xs:string external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:crearSuscriptorOCS_Res($exito,
    $codigo,
    $descripcion)