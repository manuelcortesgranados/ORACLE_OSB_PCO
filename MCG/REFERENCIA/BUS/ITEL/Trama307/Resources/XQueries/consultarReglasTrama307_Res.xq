(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama307_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA307.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/trama307Fact/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama307/trama307_DF_Trama307";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama307/";
declare namespace xf = "http://tempuri.org/ITEL/Trama307/Resources/XQueries/consultarReglasTrama307_Res/";

declare function xf:consultarReglasTrama307_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision), $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	<CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <FECHA_REGISTRO_ILIMITADO>{ data($callFunctionStatelessDecision1/ns1:resultList/ns2:TRAMA/RESULTADO/FECHA_REGISTRO_ILIMITADO) }</FECHA_REGISTRO_ILIMITADO>
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

xf:consultarReglasTrama307_Res($callFunctionStatelessDecision1,
	$descripcion,
    $tiempoI)