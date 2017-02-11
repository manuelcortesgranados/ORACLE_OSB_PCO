(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama403_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA403.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama403/trama403_DF_Trama403";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama403/";
declare namespace ns0 = "http://www.comcel.com.co/trama403Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama403/Resources/XQueries/consultarReglasTrama403_Res/";

declare function xf:consultarReglasTrama403_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <ACREDITAONPEAK>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ACREDITAONPEAK) }</ACREDITAONPEAK>
                <MONTOONPEAK>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOONPEAK) }</MONTOONPEAK>
                <MODIFICAVIGENCIAONPEAK>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MODIFICAVIGENCIAONPEAK) }</MODIFICAVIGENCIAONPEAK>
                <VIGENCIAONPEAK>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VIGENCIAONPEAK) }</VIGENCIAONPEAK>
                <ACREDITABONUS>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ACREDITABONUS) }</ACREDITABONUS>
                <MODIFICAVIGENCIABONUS>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MODIFICAVIGENCIABONUS) }</MODIFICAVIGENCIABONUS>
                <VIGENCIABONOS>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VIGENCIABONOS) }</VIGENCIABONOS>
                <MONTOBONOS>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOBONOS) }</MONTOBONOS>
                <ACREDITAMIN>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ACREDITAMIN) }</ACREDITAMIN>
                <MODIFICAVIGENCIAMIN>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MODIFICAVIGENCIAMIN) }</MODIFICAVIGENCIAMIN>
                <VIGENCIAMIN>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VIGENCIAMIN) }</VIGENCIAMIN>
                <MONTOMIN>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MONTOMIN) }</MONTOMIN>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama403_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)