(:: pragma bea:global-element-parameter parameter="$callFunctionStatelessDecision1" element="ns1:callFunctionStatelessDecision" location="../WSDLs/trama315Provision_DB.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:WS_Result" location="../Schemas/PS_ITEL_CALCULARPROVISIONTRAMA315.xsd" ::)

declare namespace ns2 = "http://www.comcel.com.co/CalcularProvisionTrama315/";
declare namespace ns1 = "http://xmlns.oracle.com/Trama315Provision/DS_Trama315Provision";
declare namespace ns0 = "http://www.comcel.com.co/Ejecutador/";
declare namespace xf = "http://tempuri.org/ITEL/Trama315/Resources/XQueries/calcularProvisionTrama315_Res/";

declare function xf:calcularProvisionTrama315_Res($callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision))
    as element(ns2:WS_Result) {
        <ns2:WS_Result>
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
                                            let $nombre := $PARAMETRO/*:NOMBRE
                                            let $parametro1 := fn-bea:inlinedXML($PARAMETRO/*:VALOR/text())/*:BestFnF_Numbers//*
                                            let $parametro2 := data($PARAMETRO/*:VALOR/text())
                                            return
                                            <PARAMETRO>
                                                <NOMBRE>{ data($PARAMETRO/*:NOMBRE) }</NOMBRE>
                                                <TIPO>{ data($PARAMETRO/*:TIPO) }</TIPO>
                                                <VALOR> {if($nombre= 'MSISDNELEGIDOTOUNREGISTER' or $nombre= 'MSISDNELEGIDOTOREGISTER') then fn-bea:inlinedXML($PARAMETRO/*:VALOR/text())/*:BestFnF_Numbers//* else data($PARAMETRO/*:VALOR/text())}</VALOR>
                                            </PARAMETRO>
                                        }
                                    </PARAMETROS>
                            }
                        </SERVICIO>
                }
            </MENSAJE>
            <DESCRIPCION>{ count($callFunctionStatelessDecision1/*:resultList/*:TRAMA_EJECUCION/*:SERVICIOSEJECUCION/*:SERVICIO) }servicios calculados</DESCRIPCION>
        </ns2:WS_Result>
};

declare variable $callFunctionStatelessDecision1 as element(ns1:callFunctionStatelessDecision) external;

xf:calcularProvisionTrama315_Res($callFunctionStatelessDecision1)