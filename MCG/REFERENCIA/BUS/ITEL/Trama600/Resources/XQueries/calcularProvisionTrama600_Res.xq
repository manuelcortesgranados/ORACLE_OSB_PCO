xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama600Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA600.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama600/Resources/XQueries/calcularProvisionTrama600_Res/";
declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama600/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama600Provision/Trama600Provision_DF_Trama600Provision";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";

declare function xf:calcularProvisionTrama600_Res($callFunctionStatelessDecision as element(ns1:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        {if (data($callFunctionStatelessDecision/*:resultList/*:TRAMA_EJECUCION/*:ERROR) = "") then
        	<CODIGO>6</CODIGO>
        else if (count($callFunctionStatelessDecision/*:resultList/*:TRAMA_EJECUCION/*:SERVICIOSEJECUCION/*:SERVICIO) > 2
        	and $callFunctionStatelessDecision/*:resultList/*:TRAMA_EJECUCION/*:SERVICIOSEJECUCION/*:SERVICIO[1]/PARAMETROS/PARAMETRO[4]/VALOR/text() = "4") then
        	<CODIGO>6</CODIGO>
        else
            <CODIGO>{ data($callFunctionStatelessDecision/*:resultList/*:TRAMA_EJECUCION/*:ERROR) }</CODIGO>
        }
            <MENSAJE>
                {
                    for $SERVICIO in $callFunctionStatelessDecision/*:resultList/*:TRAMA_EJECUCION/*:SERVICIOSEJECUCION/*:SERVICIO
                    return
                        <SERVICIO>
                            <NOMBRE>{ data($SERVICIO/*:NOMBRE) }</NOMBRE>
                            {
                                let $PARAMETROS := $SERVICIO/*:PARAMETROS
                                return
                                    <PARAMETROS>
                                        {
                                            for $PARAMETRO in $PARAMETROS/*:PARAMETRO
                                            let $nombre := $PARAMETRO/*:NOMBRE
                                            return
                                                <PARAMETRO>
                                                    <NOMBRE>{ data($PARAMETRO/*:NOMBRE) }</NOMBRE>
                                                    <TIPO>{ data($PARAMETRO/*:TIPO) }</TIPO>
                                                    <VALOR>{if($nombre= 'MSISDNELEGIDOTOREGISTER') then fn-bea:inlinedXML($PARAMETRO/*:VALOR/text())/*:BestFnF_Numbers//* else data($PARAMETRO/*:VALOR/text())}</VALOR>
                                                </PARAMETRO>
                                        }
                                    </PARAMETROS>
                            }
                        </SERVICIO>
                }
            </MENSAJE>
            <DESCRIPCION>{ count($callFunctionStatelessDecision/*:resultList/*:TRAMA_EJECUCION/*:SERVICIOSEJECUCION/*:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns1:callFunctionStatelessDecision) external;

xf:calcularProvisionTrama600_Res($callFunctionStatelessDecision)