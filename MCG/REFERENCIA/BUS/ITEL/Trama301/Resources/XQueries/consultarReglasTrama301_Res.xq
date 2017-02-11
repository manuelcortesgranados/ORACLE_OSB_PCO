(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns0:callFunctionStatelessDecision" location="../WSDLs/trama301_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA301.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/trama301Fact/";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama301/";
declare namespace ns0 = "http://xmlns.oracle.com/Trama301/trama301_DF_Trama301";
declare namespace xf = "http://tempuri.org/ITEL/Trama301/Resources/XQueries/calcularProvisionTrama301_Res/";

declare function xf:calcularProvisionTrama301_Res($callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns0:resultList/ns2:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns0:resultList/ns2:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <FECHA_REGISTRO_ILIMITADO>{ data($callFunctionStatelessDecision1/ns0:resultList/ns2:TRAMA/RESULTADO/FECHA_REGISTRO_ILIMITADO) }</FECHA_REGISTRO_ILIMITADO>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns0:resultList/ns2:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns0:resultList/ns2:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <VIGENCIA_ILIMITADO_MESES>{ data($callFunctionStatelessDecision1/ns0:resultList/ns2:TRAMA/RESULTADO/VIGENCIA_ILIMITADO_MESES) }</VIGENCIA_ILIMITADO_MESES>
                <VALIDA_MIN_COMCEL>{ data($callFunctionStatelessDecision1/ns0:resultList/ns2:TRAMA/RESULTADO/VALIDA_MIN_COMCEL) }</VALIDA_MIN_COMCEL>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns0:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:calcularProvisionTrama301_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)