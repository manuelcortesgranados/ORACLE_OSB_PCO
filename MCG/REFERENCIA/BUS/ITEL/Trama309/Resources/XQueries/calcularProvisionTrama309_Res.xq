xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama309Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA309.xsd" ::)

declare namespace xf = "http://tempuri.org/ITEL/Trama309/Resources/XQueries/calcularProvisionTrama309_Res/";
declare namespace ns2 = "http://xmlns.oracle.com/Trama309Provision/Trama309Provision_DF_Trama309Provision";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama309/";

declare function xf:calcularProvisionTrama309_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        {if (data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) = "") then
        	<CODIGO>6</CODIGO>
        else
            <CODIGO>{ data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) }</CODIGO>
        }
            <MENSAJE>
                {
                    for $SERVICIO in $callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:SERVICIOSEJECUCION/*:SERVICIO
                    return
                        <SERVICIO>
                            <NOMBRE>{ data($SERVICIO/*:NOMBRE) }</NOMBRE>
                            {
                                let $PARAMETROS := $SERVICIO/*:PARAMETROS
                                return
                                    <PARAMETROS>
                                        {
                                            for $PARAMETRO in $PARAMETROS/*:PARAMETRO
                                            return
                                                <PARAMETRO>
                                                    <NOMBRE>{ data($PARAMETRO/*:NOMBRE) }</NOMBRE>
                                                    <TIPO>{ data($PARAMETRO/*:TIPO) }</TIPO>
                                                    <VALOR>{ data($PARAMETRO/*:VALOR) }</VALOR>
                                                </PARAMETRO>
                                        }
                                    </PARAMETROS>
                            }
                        </SERVICIO>
                }
            </MENSAJE>
            <DESCRIPCION>{ count($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:SERVICIOSEJECUCION/*:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:calcularProvisionTrama309_Res($callFunctionStatelessDecision1)