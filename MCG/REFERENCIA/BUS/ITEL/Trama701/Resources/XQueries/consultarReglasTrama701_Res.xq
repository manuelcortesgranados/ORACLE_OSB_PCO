(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama701_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA701.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/ConsultarReglasTrama701/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama701/Trama701_DF_Trama701";
declare namespace ns0 = "http://www.comcel.com.co/trama701Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama701/Resources/XQueries/consultarReglasTrama701_Res/";

declare function xf:consultarReglasTrama701_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <FECHA_REGISTRO_ILIMITADO>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/FECHA_REGISTRO_ILIMITADO) }</FECHA_REGISTRO_ILIMITADO>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <CODIGO_CUENTA>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/CODIGO_CUENTA) }</CODIGO_CUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <VIGENCIA_ILIMITADO>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/VIGENCIA_ILIMITADO) }</VIGENCIA_ILIMITADO>
                <VALIDA_MIN_COMCEL>{ data($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA/RESULTADO/VALIDA_MIN_COMCEL) }</VALIDA_MIN_COMCEL>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama701_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)