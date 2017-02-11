(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama405_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA405.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama405/trama405_DF_Trama405";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama405/";
declare namespace ns0 = "http://www.comcel.com.co/trama405Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama405/Resources/XQueries/consultarReglasTrama405_Res/";

declare function xf:consultarReglasTrama405_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
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

xf:consultarReglasTrama405_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)