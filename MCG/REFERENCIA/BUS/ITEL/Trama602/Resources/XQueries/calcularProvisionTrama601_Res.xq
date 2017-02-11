(:: pragma bea:global-element-parameter parameter="$callFunctionStatefulDecision" element="ns0:callFunctionStatefulDecision" location="../WSDLs/trama602Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA602.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama602/";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns0 = "http://xmlns.oracle.com/Trama602Provision/Trama602Provision_DF_Trama602Provision";
declare namespace xf = "http://tempuri.org/ITEL/Trama602/Resources/XQueries/calcularProvisionTrama602_Res/";

declare function xf:calcularProvisionTrama602_Res($callFunctionStatefulDecision as element(ns0:callFunctionStatefulDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        {if (data($callFunctionStatefulDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:ERROR) = "") then
        	<CODIGO>6</CODIGO>
        else if (count($callFunctionStatefulDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO) > 2) then
        	<CODIGO>6</CODIGO>
        else
            <CODIGO>{ data($callFunctionStatefulDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:ERROR) }</CODIGO>
        }
            <MENSAJE>
                {
                    for $SERVICIO in $callFunctionStatefulDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO
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
            <DESCRIPCION>{ count($callFunctionStatefulDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatefulDecision as element(ns0:callFunctionStatefulDecision) external;

xf:calcularProvisionTrama602_Res($callFunctionStatefulDecision)