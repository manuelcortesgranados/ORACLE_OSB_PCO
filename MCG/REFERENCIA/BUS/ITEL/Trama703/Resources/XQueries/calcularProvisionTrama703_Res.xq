(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns2:callFunctionStatelessDecision" location="../WSDLs/trama703Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA703.xsd" ::)

declare namespace ns2 = "http://xmlns.oracle.com/Trama703Provision/Trama703Provision_DF_Trama703Provision";
declare namespace ns1 = "http://www.comcel.com.co/Ejecutador/";
declare namespace ns0 = "http://www.comcel.com.co/CalcularProvisionTrama703/";
declare namespace xf = "http://tempuri.org/ITEL/Trama703/Resources/XQueries/calcularProvisionTrama703_Res/";

declare function xf:calcularProvisionTrama703_Res($callFunctionStatelessDecision1 as element(ns2:callFunctionStatelessDecision))
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

xf:calcularProvisionTrama703_Res($callFunctionStatelessDecision1)