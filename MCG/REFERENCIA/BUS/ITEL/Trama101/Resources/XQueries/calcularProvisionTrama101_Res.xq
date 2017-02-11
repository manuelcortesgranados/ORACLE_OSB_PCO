(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns0:callFunctionStatelessDecision" location="../WSDLs/trama101Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA101.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama101/";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns0 = "http://xmlns.oracle.com/Trama101Provision/Trama101Provision_DF_Trama101Provision";
declare namespace xf = "http://tempuri.org/ITEL/Trama101/Resources/XQueries/calcularProvisionTrama101_Res/";

declare function xf:calcularProvisionTrama101_Res($callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        {if (data($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:ERROR) = "") then
        	<CODIGO>6</CODIGO>
        else
            <CODIGO>{ data($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:ERROR) }</CODIGO>
        }
            <MENSAJE>
                {
                    for $SERVICIO in $callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO
                    return
                        <SERVICIO>
                            <NOMBRE>{ data($SERVICIO/ns1:NOMBRE) }</NOMBRE>
                            {
                                let $PARAMETROS := $SERVICIO/ns1:PARAMETROS
                                return
                                    <PARAMETROS>
                                        {
                                            for $PARAMETRO in $PARAMETROS/ns1:PARAMETRO
                                            return
                                                <PARAMETRO>
                                                    <NOMBRE>{ data($PARAMETRO/ns1:NOMBRE) }</NOMBRE>
                                                    <TIPO>{ data($PARAMETRO/ns1:TIPO) }</TIPO>
                                                    <VALOR>{ data($PARAMETRO/ns1:VALOR) }</VALOR>
                                                </PARAMETRO>
                                        }
									 	</PARAMETROS>
                            }
                        </SERVICIO>
                }
            </MENSAJE>
            <DESCRIPCION>{ count($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision) external;

xf:calcularProvisionTrama101_Res($callFunctionStatelessDecision)