(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama704Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA704.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama704Provision/Trama704Provision_DF_Trama704Provision";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama704/";
declare namespace xf = "http://tempuri.org/ITEL/Trama704/Resources/XQueries/calcularProvisionTrama704_Res/";

declare function xf:calcularProvisionTrama704_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
        	{if (data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) = "") then
        		<CODIGO>6</CODIGO>
	        else
	            <CODIGO>{ data($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:ERROR) }</CODIGO>
	        }
            <MENSAJE>
                {
                    for $SERVICIO in $callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO
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
            <DESCRIPCION>{count($callFunctionStatelessDecision1/ns2:resultList/ns1:TRAMA_EJECUCION/ns1:SERVICIOSEJECUCION/ns1:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision) external;

xf:calcularProvisionTrama704_Res($callFunctionStatelessDecision1)