(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns0:callFunctionStatelessDecision" location="../WSDLs/trama405Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA405.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama405/";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns0 = "http://xmlns.oracle.com/Trama405Provision/Trama405Provision_DF_Trama405Provision";
declare namespace xf = "http://tempuri.org/ITEL/Trama405/Resources/XQueries/calcularProvisionTrama405_Res/";

declare function xf:calcularProvisionTrama405_Res($callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        {if (data($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:ERROR) = "") then
        	<CODIGO>6</CODIGO>
        else if (count($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO) > 2
        	or (count($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO) = 1
        	and $callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/SERVICIOSEJECUCION/SERVICIO[1]/NOMBRE = "ITEL/IN/Proxies/recargarWSINLocal_PS"
        	and $callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/SERVICIOSEJECUCION/SERVICIO[1]/PARAMETROS/PARAMETRO[4]/VALOR/text() = "4")) then
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

xf:calcularProvisionTrama405_Res($callFunctionStatelessDecision)