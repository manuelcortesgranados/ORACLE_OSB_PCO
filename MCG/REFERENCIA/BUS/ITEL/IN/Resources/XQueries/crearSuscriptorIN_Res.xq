(:: pragma bea:global-element-parameter parameter="$crearSuscriptorResponse" element="ns1:CrearSuscriptorResponse" location="../WSDLs/ejecutarOperacionesIN.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CREAR_SUSCRIPTOR.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/IN/OperacionCorba";
declare namespace ns0 = "http://www.comcel.com.co/CrearSuscriptorIN/";
declare namespace xf = "http://tempuri.org/ITEL/IN/Resources/XQueries/crearSuscriptorIN_Res/";

declare function xf:crearSuscriptorIN_Res($crearSuscriptorResponse as element(ns1:CrearSuscriptorResponse),
	$codigo as xs:string,
    $descripcion as xs:string)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>{$codigo}</CODIGO>
            <MENSAJE>
                <CREAR_SUSCRIPTOR exito = "{ data($crearSuscriptorResponse/@exito) }"
                                 mensaje = "{ data($crearSuscriptorResponse/@mensaje) }" />
            </MENSAJE>
            <DESCRIPCION>{ $descripcion }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $crearSuscriptorResponse as element(ns1:CrearSuscriptorResponse) external;
declare variable $codigo as xs:string external;
declare variable $descripcion as xs:string external;

xf:crearSuscriptorIN_Res($crearSuscriptorResponse,
	$codigo,
    $descripcion)