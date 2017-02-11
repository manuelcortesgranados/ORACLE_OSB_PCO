(:: pragma bea:global-element-parameter parameter="$consultarSuscriptorResponse" element="ns1:ConsultarSuscriptorResponse" location="../WSDLs/ejecutarOperacionesIN.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarSuscriptorIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/consultarSuscriptorIN_Res/";

declare function xf:consultarSuscriptorIN_Res($consultarSuscriptorResponse as element(ns1:ConsultarSuscriptorResponse),
    $codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ $codigo }</CODIGO>
            <MENSAJE>
                <CONSULTAR_SUSCRIPTOR exito = "{ data($consultarSuscriptorResponse/@exito) }"
                                      mensaje = "{ data($consultarSuscriptorResponse/@mensaje) }"
                                      cluster = "{ data($consultarSuscriptorResponse/@cluster) }">
                    <ns1:suscriptor>{ $consultarSuscriptorResponse/ns1:suscriptor/@* , $consultarSuscriptorResponse/ns1:suscriptor/node() }</ns1:suscriptor>
                </CONSULTAR_SUSCRIPTOR>
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $consultarSuscriptorResponse as element(ns1:ConsultarSuscriptorResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:consultarSuscriptorIN_Res($consultarSuscriptorResponse,
    $codigo,
    $descripcion)