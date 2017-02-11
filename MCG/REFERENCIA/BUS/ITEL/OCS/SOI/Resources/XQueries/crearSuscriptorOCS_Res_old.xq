(:: pragma bea:global-element-parameter parameter="$crearSuscriptorResponse1" element="ns1:CrearSuscriptorResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns0 = "http://www.comcel.com.co/CrearSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/crearSuscriptorOCS_Res/";

declare function xf:crearSuscriptorOCS_Res($crearSuscriptorResponse1 as element(ns1:CrearSuscriptorResponse), $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{$codigo}</CODIGO>
            <MENSAJE>
                <CREAR_SUSCRIPTOR exito = "{ data($crearSuscriptorResponse1/@exito) }"
                                  mensaje = "{ data($crearSuscriptorResponse1/@mensaje) }"/>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $crearSuscriptorResponse1 as element(ns1:CrearSuscriptorResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:crearSuscriptorOCS_Res($crearSuscriptorResponse1,
    $codigo,
    $descripcion)