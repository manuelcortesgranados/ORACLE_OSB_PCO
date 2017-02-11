(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision" element="ns0:callFunctionStatelessDecision" location="../WSDLs/trama403Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA403.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama403/";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns0 = "http://xmlns.oracle.com/Trama403Provision/Trama403Provision_DF_Trama403Provision";
declare namespace xf = "http://tempuri.org/ITEL/Trama403/Resources/XQueries/calcularProvisionTrama403_Res/";

declare function xf:calcularProvisionTrama403_Res($callFunctionStatelessDecision as element(ns0:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
        {if (data($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:ERROR) = "") then
        	<CODIGO>6</CODIGO>
        else if (count($callFunctionStatelessDecision/ns0:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO) > 3
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

xf:calcularProvisionTrama403_Res($callFunctionStatelessDecision)