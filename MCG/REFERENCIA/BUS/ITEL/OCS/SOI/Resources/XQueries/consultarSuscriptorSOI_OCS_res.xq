(:: pragma bea:global-element-parameter parameter="$consultarSuscriptorResponse1" element="ns1:ConsultarSuscriptorResponse" location="../Schemas/DA_ITEL_OPERACION_OCS_SOI.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/OCS/OperacionCorbaOCS";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscriptorOCS/";
declare namespace xf = "http://tempuri.org/ITEL/OCS/SOI/Resources/XQueries/consultarSuscriptorOCS_res/";

declare function xf:consultarSuscriptorOCS_res($consultarSuscriptorResponse1 as element(ns1:ConsultarSuscriptorResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CONSULTAR_SUSCRIPTOR exito = "{ data($consultarSuscriptorResponse1/@exito) }"
                                      mensaje = "{ data($consultarSuscriptorResponse1/@mensaje) }"
                                      cluster = "{ data($consultarSuscriptorResponse1/@cluster) }">
                    <ns1:suscriptor>{ $consultarSuscriptorResponse1/ns1:suscriptor/@* , $consultarSuscriptorResponse1/ns1:suscriptor/node() }</ns1:suscriptor>
                </CONSULTAR_SUSCRIPTOR>
             <DESCRIPCION>{ $descripcion }</DESCRIPCION>  
            </MENSAJE>
        </ns0:WS_Result>
};

declare variable $consultarSuscriptorResponse1 as element(ns1:ConsultarSuscriptorResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarSuscriptorOCS_res($consultarSuscriptorResponse1,
    $codigo,
    $descripcion)
