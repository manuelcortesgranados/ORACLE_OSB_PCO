xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama700Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA700.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama700/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama700Provision/Trama700Provision_DF_Trama700Provision";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama700/Resources/XQueries/calcularProvisionTrama700_Res/";

declare function xf:calcularProvisionTrama700_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
            {if (data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) = "") then
        		<CODIGO>6</CODIGO>
	        else
	            <CODIGO>{ data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) }</CODIGO>
	        }
            <MENSAJE>
                {
                    for $SERVICIO in $callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA_EJECUCION/ns0:SERVICIOSEJECUCION/ns0:SERVICIO
                    return
                        <SERVICIO>
                            <NOMBRE>{ data($SERVICIO/ns0:NOMBRE) }</NOMBRE>
                            {
                                let $PARAMETROS := $SERVICIO/ns0:PARAMETROS
                                return
                                    <PARAMETROS>
                                        {
                                            for $PARAMETRO in $PARAMETROS/ns0:PARAMETRO
                                            return
                                                <PARAMETRO>
                                                    <NOMBRE>{ data($PARAMETRO/ns0:NOMBRE) }</NOMBRE>
                                                    <TIPO>{ data($PARAMETRO/ns0:TIPO) }</TIPO>
                                                    <VALOR>{ data($PARAMETRO/ns0:VALOR) }</VALOR>
                                                </PARAMETRO>
                                        }
                                    </PARAMETROS>
                            }
                        </SERVICIO>
                }
            </MENSAJE>
            <DESCRIPCION>{count($callFunctionStatelessDecision1/ns1:resultList/ns0:TRAMA_EJECUCION/ns0:SERVICIOSEJECUCION/ns0:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:calcularProvisionTrama700_Res($callFunctionStatelessDecision1)