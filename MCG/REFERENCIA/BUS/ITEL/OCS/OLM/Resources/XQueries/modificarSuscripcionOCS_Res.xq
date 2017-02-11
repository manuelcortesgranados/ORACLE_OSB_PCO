(:: pragma bea:global-element-parameter parameter="$dsmnResponse1" element="ns0:dsmnResponse" location="../Schemas/DA_ITEL_OPERACION_SERVICE_OLM.xsd" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_MODIFICAR_SUSCRIPCION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/ModificarSuscripcionOCS/";
declare namespace ns0 = "http://webapps.online.ericsson.com";
declare namespace xf = "http://tempuri.org/ITEL/OCS/OLM/Resources/XQueries/modificarSuscripcionOCS_Res/";

declare function xf:modificarSuscripcionOCS_Res($dsmnResponse1 as element(ns0:dsmnResponse), $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
          <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <MODIFICAR_SUSCRIPCION>
                    {
                        for $response in $dsmnResponse1/ns0:response
                        return
                            <ns0:response>{ $response/@* , $response/node() }</ns0:response>
                    }
                </MODIFICAR_SUSCRIPCION>
            </MENSAJE>
          <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $dsmnResponse1 as element(ns0:dsmnResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;


xf:modificarSuscripcionOCS_Res($dsmnResponse1,
    $codigo,
    $descripcion)