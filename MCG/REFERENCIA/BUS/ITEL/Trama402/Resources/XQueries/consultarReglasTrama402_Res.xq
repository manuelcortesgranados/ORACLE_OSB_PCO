(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama402_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA402.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama402/trama402_DF_Trama402";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama402/";
declare namespace ns0 = "http://www.comcel.com.co/trama402Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama402/Resources/XQueries/consultarReglasTrama402_Res/";

declare function xf:consultarReglasTrama402_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <ACREDITAONPEAK>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ACREDITAONPEAK) }</ACREDITAONPEAK>
                <MONTOONPEAKORIGEN>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOONPEAKORIGEN) }</MONTOONPEAKORIGEN>
                <MONTOONPEAKDESTINO>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOONPEAKDESTINO) }</MONTOONPEAKDESTINO>
                <MODIFICAVIGENCIAONPEAK>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MODIFICAVIGENCIAONPEAK) }</MODIFICAVIGENCIAONPEAK>
                <VIGENCIAONPEAK>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VIGENCIAONPEAK) }</VIGENCIAONPEAK>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama402_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)