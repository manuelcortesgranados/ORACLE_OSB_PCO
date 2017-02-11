(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama311_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA311.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama311/trama311_DF_Trama311";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama311/";
declare namespace ns0 = "http://www.comcel.com.co/trama311Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama311/Resources/XQueries/consultarReglasTrama311_Res/";

declare function xf:consultarReglasTrama311_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),$descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <FECHA_REGISTRO_ILIMITADO>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/FECHA_REGISTRO_ILIMITADO) }</FECHA_REGISTRO_ILIMITADO>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <VIGENCIA_ILIMITADO_MESES>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VIGENCIA_ILIMITADO_MESES) }</VIGENCIA_ILIMITADO_MESES>
                <VALIDA_MIN_COMCEL>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VALIDA_MIN_COMCEL) }</VALIDA_MIN_COMCEL>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama311_Res($callFunctionStatelessDecision1,$descripcion,
    $tiempoI)