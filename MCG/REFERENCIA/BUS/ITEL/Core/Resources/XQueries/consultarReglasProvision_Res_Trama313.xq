(:: pragma bea:global-element-parameter parameter="$wS_Result1" element="ns1:WS_Result" location="../../../Trama313/Resources/Schemas/PS_ITEL_CALCULARPROVISIONTRAMA313.xsd" ::)
(:: pragma bea:global-element-return element="ns0:WS_Result" location="../Schemas/PS_ITEL_CONSULTARREGLASPROVISION.xsd" ::)

declare namespace ns1 = "http://www.comcel.com.co/CalcularProvisionTrama313/";
declare namespace ns0 = "http://www.comcel.com.co/ConsultarReglasProvision/";
declare namespace xf = "http://tempuri.org/ITEL/Core/Resources/XQueries/consultarReglasProvision_Req_CalcularProvTrama313Local/";

declare function xf:consultarReglasProvision_Req_CalcularProvTrama313Local($wS_Result1 as element(ns1:WS_Result),
    $tiempoI as xs:time)
    as element(ns0:WS_Result) {
        <ns0:WS_Result>
            <CODIGO>{ data($wS_Result1/CODIGO) }</CODIGO>
            <MENSAJE>
                {
                    for $SERVICIO in $wS_Result1/MENSAJE/SERVICIO
                    return
                        <SERVICIO>
                            <NOMBRE>{ data($SERVICIO/NOMBRE) }</NOMBRE>
                            {
                                let $PARAMETROS := $SERVICIO/PARAMETROS
                                return
                                    <PARAMETROS>
                                        {
                                            for $PARAMETRO in $PARAMETROS/PARAMETRO
                                            return
                                                <PARAMETRO>
                                                    <NOMBRE>{ data($PARAMETRO/NOMBRE) }</NOMBRE>
                                                    <TIPO>{ data($PARAMETRO/TIPO) }</TIPO>
                                                    <VALOR>{ $PARAMETRO/VALOR/node() }</VALOR>
                                                </PARAMETRO>
                                        }
                                    </PARAMETROS>
                            }
                        </SERVICIO>
                }
            </MENSAJE>
            <DESCRIPCION>{ concat($wS_Result1/DESCRIPCION , fn:current-time() - $tiempoI) }</DESCRIPCION>
        </ns0:WS_Result>
};

declare variable $wS_Result1 as element(ns1:WS_Result) external;
declare variable $tiempoI as xs:time external;

xf:consultarReglasProvision_Req_CalcularProvTrama313Local($wS_Result1,
    $tiempoI)