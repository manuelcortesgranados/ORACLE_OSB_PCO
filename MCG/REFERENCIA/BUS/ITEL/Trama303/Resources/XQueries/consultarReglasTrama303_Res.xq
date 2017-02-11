(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama303_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA303.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/trama303Fact/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama303/trama303_DF_Trama303";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama303/";
declare namespace xf = "http://tempuri.org/ITEL/Trama303/Resources/XQueries/consultarReglas303_Res/";

declare function xf:consultarReglas303_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision), $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <FECHA_RENOVACION_ILIMITADO>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/FECHA_RENOVACION_ILIMITADO) }</FECHA_RENOVACION_ILIMITADO>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <VIGENCIA_ILIMITADO_MESES>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/VIGENCIA_ILIMITADO_MESES) }</VIGENCIA_ILIMITADO_MESES>
                <VALIDA_MIN_COMCEL>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/VALIDA_MIN_COMCEL) }</VALIDA_MIN_COMCEL>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglas303_Res($callFunctionStatelessDecision1,
	$descripcion,
    $tiempoI)