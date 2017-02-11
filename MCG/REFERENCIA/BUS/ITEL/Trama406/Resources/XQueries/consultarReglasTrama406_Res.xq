(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama406_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA406.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama406/trama406_DF_Trama406";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama406/";
declare namespace ns0 = "http://www.comcel.com.co/trama406Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama406/Resources/XQueries/consultarReglasTrama406_Res/";

declare function xf:consultarReglasTrama406_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
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
                <MODIFICAVIGENCIACUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MODIFICAVIGENCIACUENTA) }</MODIFICAVIGENCIACUENTA>
                <VIGENCIACUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VIGENCIACUENTA) }</VIGENCIACUENTA>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama406_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)