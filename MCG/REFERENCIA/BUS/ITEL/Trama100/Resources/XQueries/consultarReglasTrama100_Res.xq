(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama100_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASTRAMA100.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama100/trama100_DF_Trama100";
declare namespace ns1 = "http://www.comcel.com.co/ConsultarReglasTrama100/";
declare namespace ns0 = "http://www.comcel.com.co/trama100Fact/";
declare namespace xf = "http://tempuri.org/ITEL/Trama100/Resources/XQueries/consultarReglasTrama100_Res/";

declare function xf:consultarReglasTrama100_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision),
    $descripcion as xs:string,
    $tiempoI as xs:time)
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
            <CODIGO>OK</CODIGO>
            <MENSAJE>
                <ERROR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/ERROR) }</ERROR>
                <CONSULTASUSCRIPTOR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CONSULTASUSCRIPTOR) }</CONSULTASUSCRIPTOR>
                <CARGAINICIAL>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CARGAINICIAL) }</CARGAINICIAL>
                <CREACONBLOQUEO>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CREACONBLOQUEO) }</CREACONBLOQUEO>
                <CREACONCARGAINICIAL>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CREACONCARGAINICIAL) }</CREACONCARGAINICIAL>
                <CARGADIFERIDA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/CARGADIFERIDA) }</CARGADIFERIDA>
                <MESESADIFERIR>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/MESESADIFERIR) }</MESESADIFERIR>
                <VIGENCIA_CARGA>{ data($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA/RESULTADO/VIGENCIA_CARGA) }</VIGENCIA_CARGA>
            </MENSAJE>
            <DESCRIPCION>{ concat($descripcion, fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;
declare variable $descripcion as xs:string external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasTrama100_Res($callFunctionStatelessDecision1,
    $descripcion,
    $tiempoI)