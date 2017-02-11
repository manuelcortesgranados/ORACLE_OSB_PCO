(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama703_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA703.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama703/trama703_DF_Trama703";
declare namespace ns1 = "http://www.comcel.com.co/trama703Fact/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasTrama703/";
declare namespace xf = "http://tempuri.org/ITEL/Trama703/Resources/XQueries/consultarReglasTrama703_Res/";

declare function xf:consultarReglasTrama703_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <FECHA_RENOVACION_ILIMITADO>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/FECHA_RENOVACION_ILIMITADO) }</FECHA_RENOVACION_ILIMITADO>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <CODIGO_CUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/CODIGO_CUENTA) }</CODIGO_CUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <VIGENCIA_ILIMITADO>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/VIGENCIA_ILIMITADO) }</VIGENCIA_ILIMITADO>
                <VALIDA_MIN_COMCEL>{ data($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA/RESULTADO/VALIDA_MIN_COMCEL) }</VALIDA_MIN_COMCEL>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama703_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)