(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama503Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA503.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama503Provision/Trama503Provision_DF_Trama503Provision";
declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama503/";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama503/Resources/XQueries/calcularProvisionTrama503_Res/";

declare function xf:calcularProvisionTrama503_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns1:WS_Result) {
        <ns1:WS_Result>
        	{if (data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) = "") then
        		<CODIGO>6</CODIGO>
	        else
	            <CODIGO>{ data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) }</CODIGO>
	        }
            <MENSAJE>
                {
                    for $SERVICIO in $callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA_EJECUCION/ns0:SERVICIOSEJECUCION/ns0:SERVICIO
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
            <DESCRIPCION>{count($callFunctionStatelessDecision1/ns2:resultList/ns0:TRAMA_EJECUCION/ns0:SERVICIOSEJECUCION/ns0:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns1:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:calcularProvisionTrama503_Res($callFunctionStatelessDecision1)