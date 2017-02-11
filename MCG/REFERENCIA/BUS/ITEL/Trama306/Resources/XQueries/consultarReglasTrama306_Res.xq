(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama306_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA306.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglasTrama306/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama306/trama306_DF_Trama306";
declare namespace ns0 = "http://www.comcel.com.co/trama306Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama306/Resources/XQueries/consultarReglasTrama306_Res/";

declare function xf:consultarReglasTrama306_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <VALIDA_MIN_COMCEL>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/VALIDA_MIN_COMCEL) }</VALIDA_MIN_COMCEL>
                <VIGENCIA_ILIMITADO_MESES>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/VIGENCIA_ILIMITADO_MESES) }</VIGENCIA_ILIMITADO_MESES>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama306_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)