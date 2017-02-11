(:: pragma bea:global-element-parameter parameter="$dsmnResponse1" element="ns1:dsmnResponse" location="../Schemas/DA_ITEL_OPERACION_PROVISION_OLM.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CREAR_SUSCRIPCION.xsd" ::)

declare namespace ns1 = "http://webapps.online.ericsson.com";
declare namespace ns0 = "http://www.comcel.com.co/CrearSuscripcionOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/crearSuscripcionOCS_Res/";

declare function xf:crearSuscripcionOCS_Res($dsmnResponse1 as element(ns1:dsmnResponse), $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CREAR_SUSCRIPCION>
                    {
                        for $response in $dsmnResponse1/ns1:response
                        return
                            <ns1:response>{ $response/@* , $response/node() }</ns1:response>
                    }
                </CREAR_SUSCRIPCION>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $dsmnResponse1 as element(ns1:dsmnResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:crearSuscripcionOCS_Res($dsmnResponse1,
    $codigo,
    $descripcion)