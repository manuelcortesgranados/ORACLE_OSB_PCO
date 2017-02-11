(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama415Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA415.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama415/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama415Provision/Trama415Provision_DF_CalcularProvTrama415";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama415/Resources/XQueries/calcularRespuesta/";

declare function xf:calcularRespuesta($callFunctionStatelessDecision as element(ns1:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            <CODIGO>{ data($callFunctionStatelessDecision/*:resultList/*:TRAMA_EJECUCION/*:ERROR) }</CODIGO>
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
                                            return
                                                <PARAMETRO>
                                                    <NOMBRE>{ data($PARAMETRO/*:NOMBRE) }</NOMBRE>
                                                    <TIPO>{ data($PARAMETRO/*:TIPO) }</TIPO>
                                                    <VALOR>{ fn-bea:inlinedXML(($PARAMETRO/*:VALOR)) }</VALOR>
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

xf:calcularRespuesta($callFunctionStatelessDecision)