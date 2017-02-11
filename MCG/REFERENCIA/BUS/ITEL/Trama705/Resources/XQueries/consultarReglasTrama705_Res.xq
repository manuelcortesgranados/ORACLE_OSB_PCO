(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns0:callFunctionStatelessDecision" location="../WSDLs/trama705_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA705.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglasTrama705/";
declare namespace ns1 = "http://www.comcel.com.co/trama705Fact/";
declare namespace ns0 = "http://xmlns.oracle.com/Trama705/Trama705_DF_Trama705";
declare namespace xf = "http://tempuri.org/ITEL/Trama705/Resources/XQueries/consultarReglasTrama705_Res/";

declare function xf:consultarReglasTrama705_Res($callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns0:resultList/ns1:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns0:resultList/ns1:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns0:resultList/ns1:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns0:resultList/ns1:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <CANTIDAD_MENSAJES>{ data($callFunctionStatelessDecision1/ns0:resultList/ns1:TRAMA/RESULTADO/CANTIDAD_MENSAJES) }</CANTIDAD_MENSAJES>
                <VIGENCIA_MENSAJES>{ data($callFunctionStatelessDecision1/ns0:resultList/ns1:TRAMA/RESULTADO/VIGENCIA_MENSAJES) }</VIGENCIA_MENSAJES>
                <VALIDA_MIN_COMCEL>{ data($callFunctionStatelessDecision1/ns0:resultList/ns1:TRAMA/RESULTADO/VALIDA_MIN_COMCEL) }</VALIDA_MIN_COMCEL>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama705_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)