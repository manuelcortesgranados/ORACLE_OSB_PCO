(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama601_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA601.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama601/trama601_DF_Trama601";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama601/";
declare namespace ns0 = "http://www.comcel.com.co/trama601Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama601/Resources/XQueries/consultarReglasTrama601_Res/";

declare function xf:consultarReglasTrama601_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
                <CONTRACT>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONTRACT) }</CONTRACT>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama601_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)