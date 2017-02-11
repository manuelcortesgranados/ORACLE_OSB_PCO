(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama200_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA200.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama200/trama200_DF_Trama200";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama200/";
declare namespace ns0 = "http://www.comcel.com.co/trama200Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama200/Resources/XQueries/consultarReglasTrama200_Res/";

declare function xf:consultarReglasTrama200_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <ACREDITACUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ACREDITACUENTA) }</ACREDITACUENTA>
                <CONSULTASDIA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASDIA) }</CONSULTASDIA>
                <CONSULTASREALIZADAS>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASREALIZADAS) }</CONSULTASREALIZADAS>
                <TIPOCONSULTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/TIPOCONSULTA) }</TIPOCONSULTA>
                <MONTOCUENTA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOCUENTA) }</MONTOCUENTA>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama200_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)